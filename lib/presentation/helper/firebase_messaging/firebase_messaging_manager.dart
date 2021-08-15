import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart' hide Notification;

import '../../../data/source/remote/model/mapper/remote_notification_data_mapper.dart';
import '../../../data/source/remote/model/remote_notification_data.dart';
import '../../../domain/entity/notification.dart';
import '../../../domain/usecase/save_device_token_use_case.dart';
import '../../../shared/utils/file_utils.dart';
import '../../../shared/utils/log_utils.dart';
import 'firebase_messaging_constants.dart';

@LazySingleton()
class FirebaseMessagingManager {
  final _messaging = FirebaseMessaging.instance;
  final SaveDeviceTokenUseCase _saveDeviceTokenUseCase;
  final RemoteNotificationDataMapper _remoteNotificationDataMapper;

  static const tag = 'FirebaseMessagingManager';
  static const _channelId = 'com.basecleanflutter';
  static const _channelName = 'Hot News';
  static const _channelDescription = 'Update hot news every day';

  final _notificationController = PublishSubject<Notification>();

  /// output
  Stream<Notification> get notification => _notificationController.stream;

  FirebaseMessagingManager(this._saveDeviceTokenUseCase, this._remoteNotificationDataMapper);

  /// setup flutter_local_notifications
  Future<void> init() async {
    /// Change icon at basecleanflutter\android\app\src\main\res\drawable\app_icon.png
    final androidInit = const AndroidInitializationSettings('app_icon');

    /// don't request permission here
    /// we use firebase_messaging package to request permission instead
    final iOSInit = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final init = InitializationSettings(android: androidInit, iOS: iOSInit);

    /// onNewToken
    unawaited(_messaging.getToken().then(_saveDeviceToken));
    _messaging.onTokenRefresh.listen(_saveDeviceToken);

    /// init local notification
    await Future.wait([
      FlutterLocalNotificationsPlugin().initialize(
        init,
        onSelectNotification: _onSelectNotification,
      ),
    ]);

    /// Set the background messaging handler early on
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
            _channelId, _channelName, _channelDescription,
            importance: Importance.high));

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    printKV(tag, 'FirebaseMessagingManager init success');
  }

  void requestPermission() async {
    /// ios only
    final NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      printKV(tag, 'User granted permission');
      _onMessageReceived();
    } else {
      printKV(tag, 'User declined or has not accepted permission');
    }
  }

  void _saveDeviceToken(String? token) {
    printKV(tag, 'onNewToken = $token');
    if (token != null) _saveDeviceTokenUseCase(token);
  }

  void _onMessageReceived() {
    /// handle user click notification when app was terminated
    _messaging.getInitialMessage().then((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        printKV(tag, 'onInitialMessage ${remoteMessage.notification?.title}');
        _emitNotification(remoteMessage.data);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      printKV(tag, 'onMessage ${remoteMessage.notification?.title}');
      _sendNotification(remoteMessage);
    }, onError: print);

    /// handle user click notification when app on background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      printKV(tag, 'onMessageOpenedApp ${remoteMessage.notification?.title}');
      _emitNotification(remoteMessage.data);
    });
  }

  /// handle user click notification when app on foreground
  Future<void> _onSelectNotification(String? payloadJson) {
    if (payloadJson == null) {
      return SynchronousFuture(null);
    }

    try {
      final data = jsonDecode(payloadJson) as Map<String, dynamic>;
      printKV(tag, '_onSelectNotification payload=$data');
      _emitNotification(data);
    } catch (e, _) {
      printKV(tag, 'onSelectNotification payload=$payloadJson error=$e');
    }

    return SynchronousFuture(null);
  }

  void _emitNotification(Map<String, dynamic> map) {
    final notification =
        _remoteNotificationDataMapper.mapToEntity(RemoteNotificationData.fromJson(map));
    _notificationController.add(notification);
  }

  void _sendNotification(RemoteMessage remoteMessage) async {
    final notification = remoteMessage.notification;
    final data = remoteMessage.data;
    File? imageFile;
    if (data.containsKey(FirebaseMessagingConstants.firebaseKeyImage)) {
      imageFile = await getImageFileFromUrl(data[FirebaseMessagingConstants.firebaseKeyImage]);
    }

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      autoCancel: true,
      enableVibration: true,
      playSound: true,
      styleInformation: imageFile != null
          ? BigPictureStyleInformation(
              FilePathAndroidBitmap(imageFile.path),
              hideExpandedLargeIcon: true,
            )
          : null,
    );
    final iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    final platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    await FlutterLocalNotificationsPlugin()
        .show(
          _randomNotificationId,
          notification?.title ?? '',
          notification?.body ?? '',
          platformChannelSpecifics,
          payload: jsonEncode(data),
        )
        .onError((error, stackTrace) => printKV(tag, 'Can not show notification cause $error'));
  }

  int get _randomNotificationId => Random().nextInt(pow(2, 31).toInt() - 1);
}

/// _handleBackgroundMessage must be top-level function
Future _handleBackgroundMessage(RemoteMessage remoteMessage) async {
  /// If you're going to use other Firebase services in the background, such as Firestore,
  /// make sure you call `Firebase.initializeApp()` before using other Firebase services.
  // await Firebase.initializeApp();
  printKV(FirebaseMessagingManager.tag, 'onBackgroundMessage ${remoteMessage.notification?.title}');
}
