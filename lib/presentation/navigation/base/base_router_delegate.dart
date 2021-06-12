import 'navigator_stack.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/log/log_utils.dart';
import '../app_pages.dart';

class BaseRouterDelegate extends RouterDelegate<AppPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPage> {
  final _navigatorStack = NavigatorStack();
  late GlobalKey<NavigatorState> _navigatorKey;

  get stack => _navigatorStack.pages;

  final List<Widget> initialPages;
  final List<NavigatorObserver> navigatorObservers;

  BaseRouterDelegate(
      [this.initialPages = const [], this.navigatorObservers = const []]) {
    _navigatorStack.addAll(initialPages);
    _navigatorKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    printKV(tag, _navigatorStack);
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      observers: navigatorObservers,
      pages: stack,
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(AppPage configuration) async {
    printKV(tag, 'setNewRoutePath $configuration');
  }

  /// called when press button back android
  /// if return false, the entire app will be popped
  @override
  Future<bool> popRoute() {
    printKV(tag, 'popRoute');
    if (stack.length > 1) {
      _navigatorStack.pop();
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  /// called when Navigator.of(context).pop() is invoked
  bool _onPopPage(Route<dynamic> route, result) {
    printKV(tag, '_onPopPage result=$result');
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _navigatorStack.pop();
    return true;
  }

  void push(Widget widget) {
    _navigatorStack.push(widget);
    notifyListeners();
  }

  void pushAll(List<Widget> widgets) {
    _navigatorStack.pushAll(widgets);
    notifyListeners();
  }

  void popAndPush(Widget widget) {
    _navigatorStack.popAndPush(widget);
    notifyListeners();
  }

  void popAllAndPush(Widget widget) {
    _navigatorStack.popAllAndPush(widget);
    notifyListeners();
  }

  void popAllAndPushAll(List<Widget> widgets) {
    _navigatorStack.popAllAndPushAll(widgets);
    notifyListeners();
  }

  void pop() {
    _navigatorStack.pop();
    notifyListeners();
  }

  void popMultiPages(int number) {
    _navigatorStack.popMultiPages(number);
    notifyListeners();
  }

  void popUntilRoot() {
    _navigatorStack.popUntilRoot();
    notifyListeners();
  }

  void removeAllPagesOfType(Type type) {
    _navigatorStack.removeAllPagesOfType(type);
    notifyListeners();
  }

  void removePageAt(int index) {
    _navigatorStack.removePageAt(index);
    notifyListeners();
  }

  void removeMultiPages(int fromInclusive, int toInclusive) {
    _navigatorStack.removeMultiPages(fromInclusive, toInclusive + 1);
    notifyListeners();
  }

  void insertPageAt(int index, Widget widget) {
    _navigatorStack.insertPageAt(index, widget);
    notifyListeners();
  }

  void insertMultiPages(int index, List<Widget> widgets) {
    _navigatorStack.insertMultiPages(index, widgets);
    notifyListeners();
  }

  get tag => 'BaseRouterDelegate';
}
