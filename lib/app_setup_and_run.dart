import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'build_config.dart';
import 'data/source/remote/api/config/http_request_log_config.dart';
import 'di/di.dart';
import 'presentation/helper/deeplink/deep_link.dart';
import 'presentation/helper/firebase_messaging/firebase_messaging.dart';
import 'presentation/ui/app.dart';
import 'utils/stream/dispose_bag.dart';
import 'utils/stream/stream_logger.dart';

class App {
  static run() async {
    await _setup();
    runZonedGuarded(_runMyApp, _reportError);
  }

  static _setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// setup DI
    await configureInjection();

    /// config Equatable
    EquatableConfig.stringify = true;

    /// config logging
    _configLogging();

    await Future.wait([
      SystemChrome.setEnabledSystemUIOverlays(
          [SystemUiOverlay.bottom, SystemUiOverlay.top]),
      BuildConfig.getPackageName(),
      BuildConfig.getVersionCode(),
      BuildConfig.getVersionName(),
      Firebase.initializeApp().then(
          (value) => GetIt.instance.get<FirebaseMessagingManager>().init()),
    ]);
  }

  static _runMyApp() async {
    final deepLinkManager = GetIt.instance.get<DeepLinkManager>();
    final deepLinkResult =
        await deepLinkManager.getInitialDeepLink().catchError((e) => null);
    runApp(MyApp(deepLinkResult));
  }

  static _reportError(Object error, StackTrace stacktrace) {
    print('uncaught error: $error');
    // report error by sentry or firebase crashlytic
  }

  static _configLogging() {
    /// config http request logging
    HttpRequestLogConfig.enableLogInterceptor = kDebugMode;

    /// config stream logging
    StreamLoggerConfig.enableStreamLogger = kDebugMode;

    /// config DisposeBag logging
    DisposeBagConfig.enableLogging = kDebugMode;
  }
}
