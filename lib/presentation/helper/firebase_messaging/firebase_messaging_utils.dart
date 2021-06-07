import 'package:auto_route/auto_route.dart';

import '../../../domain/entity/notification.dart';
import '../../router/app_router.gr.dart';
import 'firebase_messaging.dart';

class FirebaseMessagingUtils {
  /// use for both MainScreen and NotificationScreen
  static List<PageRouteInfo>? parseNotification(Notification notification) {
    switch (notification.notificationType) {
      case FirebaseMessagingConstants.firebaseActionCommentOnPost:
        return [GalleryScreenRoute(notification: notification)];
      default:
        return [GalleryScreenRoute(notification: notification)];
    }
  }
}
