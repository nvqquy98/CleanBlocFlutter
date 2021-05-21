import '../../utils/utils.dart';
import 'package:flutter/material.dart';

class AppRouterObserver extends NavigatorObserver {
  final BuildContext context;

  AppRouterObserver(this.context);

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    context.hideKeyboard();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    context.hideKeyboard();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }

  static const tag = 'AppRouterObserver';
}