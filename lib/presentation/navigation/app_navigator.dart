import 'page_action.dart';

import 'app_router_delegate.dart';

import 'package:flutter/material.dart';

import 'app_route_information_parser.dart';
import 'package:provider/provider.dart';

class AppNavigator {
  AppRouterDelegate? _appRouterDelegate;
  final _appRouteInformationParser = AppRouteInformationParser();

  AppRouteInformationParser get routeInformationParser =>
      _appRouteInformationParser;

  get stack => _appRouterDelegate!.pages;

  AppRouterDelegate delegate(
      {List<Widget> initialPages = const [],
      List<NavigatorObserver> navigatorObservers = const []}) {
    return _appRouterDelegate ??=
        AppRouterDelegate(initialPages, navigatorObservers);
  }

  void push(Widget widget) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.push(widget));
  }

  void pushAll(List<Widget> widgets) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.pushAll(widgets));
  }

  void popAndPush(Widget widget) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.popAndPush(widget));
  }

  void popAllAndPush(Widget widget) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.popAllAndPush(widget));
  }

  void popAllAndPushAll(List<Widget> widgets) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.popAllAndPushAll(widgets));
  }

  void pop() {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(const PageAction.pop());
  }

  void popMultiPages(int number) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.popMultiPages(number));
  }

  void popUntilRoot() {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(const PageAction.popUntilRoot());
  }

  void removeAllPagesOfType(Type type) {
    assert(_appRouterDelegate != null);
    _appRouterDelegate?.setAction(PageAction.removeAllPagesOfType(type));
  }

  static AppNavigator of(BuildContext context) {
    return context.read<AppNavigator>();
  }
}
