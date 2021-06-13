import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/log/log_utils.dart';
import '../app_pages.dart';

class BaseRouterDelegate extends RouterDelegate<AppPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPage> {
  final List<Page> _pages = [];
  late GlobalKey<NavigatorState> _navigatorKey;

  List<Page> get stack => List.unmodifiable(_pages);

  final List<Widget> initialPages;
  final List<NavigatorObserver> navigatorObservers;

  BaseRouterDelegate(
      [this.initialPages = const [], this.navigatorObservers = const []]){
    _pages.addAll(initialPages.map(_createPage));
    _navigatorKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    printStack();
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      observers: navigatorObservers,
      pages: List.unmodifiable(_pages),
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

    /// update stack
    if (stack.length > 1) {
      _pop();
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  /// called when [Navigator.of(context).pop()] is invoked
  bool _onPopPage(Route<dynamic> route, result) {
    printKV(tag, '_onPopPage result=$result');
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    /// update stack
    _pop();
    return true;
  }

  void push(Widget widget, [notify = true]) {
    _push(widget);
    if (notify) notifyListeners();
  }

  void pushAll(List<Widget> widgets, [notify = true]) {
    _pushAll(widgets);
    if (notify) notifyListeners();
  }

  void popAndPush(Widget widget, [notify = true]) {
    _popAndPush(widget);
    if (notify) notifyListeners();
  }

  void popAllAndPush(Widget widget, [notify = true]) {
    _popAllAndPush(widget);
    if (notify) notifyListeners();
  }

  void popAllAndPushAll(List<Widget> widgets, [notify = true]) {
    _popAllAndPushAll(widgets);
    if (notify) notifyListeners();
  }

  void pop([notify = true]) {
    _pop();
    if (notify) notifyListeners();
  }

  void popMultiPages(int number, [notify = true]) {
    _popMultiPages(number);
    if (notify) notifyListeners();
  }

  void popUntilRoot([notify = true]) {
    _popUntilRoot();
    if (notify) notifyListeners();
  }

  void removeAllPagesOfType(Type type, [notify = true]) {
    _removeAllPagesOfType(type);
    if (notify) notifyListeners();
  }

  void removePageAt(int index, [notify = true]) {
    _removePageAt(index);
    if (notify) notifyListeners();
  }

  void removeMultiPages(int fromInclusive, int toInclusive, [notify = true]) {
    _removeMultiPages(fromInclusive, toInclusive + 1);
    if (notify) notifyListeners();
  }

  void insertPageAt(int index, Widget widget, [notify = true]) {
    _insertPageAt(index, widget);
    if (notify) notifyListeners();
  }

  void insertMultiPages(int index, List<Widget> widgets, [notify = true]) {
    _insertMultiPages(index, widgets);
    if (notify) notifyListeners();
  }

  final _childNavigators = <BaseRouterDelegate>[];
  BaseRouterDelegate? _parent;
  List<Router>? _routers;

  BaseRouterDelegate getChildAt(int index) => _childNavigators.elementAt(index);

  BaseRouterDelegate? get parent => _parent;

  get isRoot => _parent == null;

  BaseRouterDelegate get root {
    var r = this;
    while (!r.isRoot) {
      r = r.parent!;
    }
    return r;
  }

  List<Router> createChildRouter(List<BaseRouterDelegate> navigators) {
    if (_routers != null) return _routers!;
    final routers = navigators
        .map((e) => Router(routerDelegate: e.._parent = this))
        .toList(growable: false);
    _routers = routers;
    return _routers!;
  }

  void _pop() {
    _pages.removeLast();
  }

  void _popAll() {
    _pages.clear();
  }

  void _popMultiPages(int number) {
    for (var i = 1; i <= number; i++) {
      _pop();
    }
  }

  void _popUntilRoot() {
    _popMultiPages(_pages.length - 1);
  }

  void _removeAllPagesOfType(Type runtimeType) {
    _pages.removeWhere((page) => page.runtimeType == runtimeType);
  }

  void _push(Widget widget) {
    _pages.add(_createPage(widget));
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

  void _removePageAt(int index) {
    _pages.removeAt(index);
  }

  void _removeMultiPages(int fromInclusive, int toInclusive) {
    _pages.removeRange(fromInclusive, toInclusive + 1);
  }

  void _insertPageAt(int index, Widget widget) {
    _pages.insert(index, _createPage(widget));
  }

  void _insertMultiPages(int index, List<Widget> widgets) {
    _pages.insertAll(index, widgets.map(_createPage));
  }

  MaterialPage _createPage(Widget child) {
    return MaterialPage(
      child: child,
      name: child.runtimeType.toString(),
      key: ValueKey(child.runtimeType.toString()),
    );
  }
  
  void printStack() {
    printKV(tag, 'Stack: ${_pages.map((e) => e.name).join(' -> ')}');
  }

  get tag => 'BaseRouterDelegate';
}
