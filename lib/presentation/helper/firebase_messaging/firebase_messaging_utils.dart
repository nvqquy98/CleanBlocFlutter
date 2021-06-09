import '../../ui/gallery/gallery_screen.dart';
import 'package:flutter/material.dart' hide Notification;

import '../../../domain/entity/notification.dart';
import 'firebase_messaging.dart';

class FirebaseMessagingUtils {
  /// use for both MainScreen and NotificationScreen
  static List<Widget>? parseNotification(Notification notification) {
    switch (notification.notificationType) {
      case FirebaseMessagingConstants.firebaseActionCommentOnPost:
        return [GalleryScreen(notification: notification)];
      default:
        return [GalleryScreen(notification: notification)];
    }
  }
}
