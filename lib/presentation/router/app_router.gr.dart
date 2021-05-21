// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../ui/home/home_screen.dart' as _i5;
import '../ui/login/login_screen.dart' as _i3;
import '../ui/reset_password/reset_password_screen.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoginScreen();
        }),
    ResetPasswordScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ResetPasswordScreenRouteArgs>();
          return _i4.ResetPasswordScreen(
              resetPasswordToken: args.resetPasswordToken);
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false),
    HomeScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HomeScreenRouteArgs>(
              orElse: () => const HomeScreenRouteArgs());
          return _i5.HomeScreen(isFromLogin: args.isFromLogin);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i1.RouteConfig(ResetPasswordScreenRoute.name,
            path: '/reset-password-screen'),
        _i1.RouteConfig(HomeScreenRoute.name, path: '/home-screen')
      ];
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

class ResetPasswordScreenRoute
    extends _i1.PageRouteInfo<ResetPasswordScreenRouteArgs> {
  ResetPasswordScreenRoute({required String resetPasswordToken})
      : super(name,
            path: '/reset-password-screen',
            args: ResetPasswordScreenRouteArgs(
                resetPasswordToken: resetPasswordToken));

  static const String name = 'ResetPasswordScreenRoute';
}

class ResetPasswordScreenRouteArgs {
  const ResetPasswordScreenRouteArgs({required this.resetPasswordToken});

  final String resetPasswordToken;
}

class HomeScreenRoute extends _i1.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({bool isFromLogin = false})
      : super(name,
            path: '/home-screen',
            args: HomeScreenRouteArgs(isFromLogin: isFromLogin));

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.isFromLogin = false});

  final bool isFromLogin;
}
