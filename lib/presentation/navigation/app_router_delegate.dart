import 'package:flutter/material.dart';

import 'app_pages.dart';
import 'page_action.dart';

class AppRouterDelegate extends RouterDelegate<AppPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPage> {
  final List<Page> pages = [];

  final List<Widget> initialPages;
  final List<NavigatorObserver> navigatorObservers;

  AppRouterDelegate(this.initialPages, this.navigatorObservers) {
    pages.addAll(initialPages.map(_createPage));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      observers: navigatorObservers,
      pages: pages,
    );
  }

  void setAction(PageAction action) {
    action.when(
      push: _push,
      pushAll: _pushAll,
      popAndPush: _popAndPush,
      popAllAndPush: _popAllAndPush,
      popAllAndPushAll: _popAllAndPushAll,
      pop: _pop,
      popMultiPages: _popMultiPages,
      popUntilRoot: _popUntilRoot,
      removeAllPagesOfType: _removeAllPagesOfType,
    );

    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  /// called before a new route has been pushed by OS. Ex: new intent, deep link, launcher
  /// which gives our app opportunity to update the app state based on the changes to the route
  @override
  Future<void> setNewRoutePath(AppPage configuration) async {
    return null;
  }

  /// called when press button back android
  @override
  Future<bool> popRoute() {
    return Future.value(_pop());
  }

  /// called when Navigator.of(context).pop() is invoked
  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    return _pop();
  }

  bool _canPop() {
    return pages.length > 1;
  }

  bool _pop() {
    if (_canPop()) {
      pages.removeLast();
      return true;
    }

    return false;
  }

  void _popAll() {
    pages.clear();
  }

  void _popMultiPages(int number) {
    for (var i = 1; i <= number; i++) {
      _pop();
    }
  }

  void _popUntilRoot() {
    _popMultiPages(pages.length - 1);
  }

  void _removeAllPagesOfType(Type runtimeType) {
    pages.removeWhere((page) => page.runtimeType == runtimeType);
  }

  void _push(Widget widget) {
    pages.add(_createPage(widget));
  }

  void _pushAll(List<Widget> widgets) {
    widgets.map(_push);
  }

  void _popAndPush(Widget widget) {
    _pop();
    _push(widget);
  }

  void _popAllAndPush(Widget widget) {
    _popAll();
    _push(widget);
  }

  void _popAllAndPushAll(List<Widget> widgets) {
    _popAll();
    _pushAll(widgets);
  }

  MaterialPage _createPage(Widget child, {AppPage? pageConfig}) {
    return MaterialPage(
        child: child,
        key: pageConfig != null
            ? ValueKey(pageConfig.runtimeType.toString())
            : null,
        name: pageConfig?.path,
        arguments: pageConfig);
  }
}
