// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../ui/edit_profile/edit_profile_screen.dart' as _i11;
import '../ui/gallery/gallery_screen.dart' as _i6;
import '../ui/home/home_screen.dart' as _i8;
import '../ui/home_detail/home_detail_screen.dart' as _i9;
import '../ui/login/login_screen.dart' as _i3;
import '../ui/main/main_bloc.dart' as _i13;
import '../ui/main/main_screen.dart' as _i5;
import '../ui/map/map_screen.dart' as _i7;
import '../ui/profile/profile_screen.dart' as _i10;
import '../ui/reset_password/reset_password_screen.dart' as _i4;
import '../ui/setting/settings_screen.dart' as _i12;

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
    MainScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.MainScreen();
        }),
    GalleryScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.GalleryScreen();
        }),
    MapScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MapScreenRouteArgs>();
          return _i7.MapScreen(key: args.key, mainBloc: args.mainBloc);
        }),
    BottomTabHomeRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    BottomTabProfileRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    BottomTabSettingsRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    HomeScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.HomeScreen();
        }),
    HomeDetailScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.HomeDetailScreen();
        }),
    ProfileScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.ProfileScreen();
        }),
    EditProfileScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.EditProfileScreen();
        }),
    SettingsScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.SettingsScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i1.RouteConfig(ResetPasswordScreenRoute.name,
            path: '/reset-password-screen'),
        _i1.RouteConfig(MainScreenRoute.name, path: '/main-screen', children: [
          _i1.RouteConfig(BottomTabHomeRouter.name,
              path: 'empty-router-page',
              children: [
                _i1.RouteConfig(HomeScreenRoute.name, path: ''),
                _i1.RouteConfig(HomeDetailScreenRoute.name,
                    path: 'home-detail-screen')
              ]),
          _i1.RouteConfig(BottomTabProfileRouter.name,
              path: 'empty-router-page',
              children: [
                _i1.RouteConfig(ProfileScreenRoute.name, path: ''),
                _i1.RouteConfig(EditProfileScreenRoute.name,
                    path: 'edit-profile-screen')
              ]),
          _i1.RouteConfig(BottomTabSettingsRouter.name,
              path: 'empty-router-page',
              children: [_i1.RouteConfig(SettingsScreenRoute.name, path: '')])
        ]),
        _i1.RouteConfig(GalleryScreenRoute.name, path: '/gallery-screen'),
        _i1.RouteConfig(MapScreenRoute.name, path: '/map-screen')
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

class MainScreenRoute extends _i1.PageRouteInfo {
  const MainScreenRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/main-screen', initialChildren: children);

  static const String name = 'MainScreenRoute';
}

class GalleryScreenRoute extends _i1.PageRouteInfo {
  const GalleryScreenRoute() : super(name, path: '/gallery-screen');

  static const String name = 'GalleryScreenRoute';
}

class MapScreenRoute extends _i1.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute({_i2.Key? key, required _i13.MainBloc mainBloc})
      : super(name,
            path: '/map-screen',
            args: MapScreenRouteArgs(key: key, mainBloc: mainBloc));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.mainBloc});

  final _i2.Key? key;

  final _i13.MainBloc mainBloc;
}

class BottomTabHomeRouter extends _i1.PageRouteInfo {
  const BottomTabHomeRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'empty-router-page', initialChildren: children);

  static const String name = 'BottomTabHomeRouter';
}

class BottomTabProfileRouter extends _i1.PageRouteInfo {
  const BottomTabProfileRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'empty-router-page', initialChildren: children);

  static const String name = 'BottomTabProfileRouter';
}

class BottomTabSettingsRouter extends _i1.PageRouteInfo {
  const BottomTabSettingsRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'empty-router-page', initialChildren: children);

  static const String name = 'BottomTabSettingsRouter';
}

class HomeScreenRoute extends _i1.PageRouteInfo {
  const HomeScreenRoute() : super(name, path: '');

  static const String name = 'HomeScreenRoute';
}

class HomeDetailScreenRoute extends _i1.PageRouteInfo {
  const HomeDetailScreenRoute() : super(name, path: 'home-detail-screen');

  static const String name = 'HomeDetailScreenRoute';
}

class ProfileScreenRoute extends _i1.PageRouteInfo {
  const ProfileScreenRoute() : super(name, path: '');

  static const String name = 'ProfileScreenRoute';
}

class EditProfileScreenRoute extends _i1.PageRouteInfo {
  const EditProfileScreenRoute() : super(name, path: 'edit-profile-screen');

  static const String name = 'EditProfileScreenRoute';
}

class SettingsScreenRoute extends _i1.PageRouteInfo {
  const SettingsScreenRoute() : super(name, path: '');

  static const String name = 'SettingsScreenRoute';
}
