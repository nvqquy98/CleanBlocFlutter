import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';

import '../../ui/edit_profile/edit_profile_screen.dart';
import '../../ui/gallery/gallery_screen.dart';
import '../../ui/home/home_screen.dart';
import '../../ui/home_detail/home_detail_screen.dart';
import '../../ui/login/login_screen.dart';
import '../../ui/login_options/login_options_screen.dart';
import '../../ui/main/main_screen.dart';
import '../../ui/profile/profile_screen.dart';
import '../../ui/reset_password/reset_password_screen.dart';
import '../../ui/setting/settings_screen.dart';
import '../app_pages.dart';
import '../app_route_information_parser.dart';
import '../base/base_router_delegate.dart';

class AppNavigator extends BaseRouterDelegate {
  AppNavigator(List<Widget> initialPages) : super(initialPages);

  /// support Web Platform, if project does not support Web, no need override this method
  /// This method called when a new route has been pushed by OS.
  /// Ex: launcher, url on browser (web platform)
  /// param [configuration] is passed from [AppRouteInformationParser]
  /// which gives our app opportunity to update the app state based on the changes to the route
  /// when state changed, Navigator is rebuilt
  @override
  Future<void> setNewRoutePath(AppPage configuration) async {
    unawaited(super.setNewRoutePath(configuration));
    final List<Widget> widgets = configuration.when(
      unknown: () => [],
      initial: () => [],
      loginOptions: () => [const LoginOptionsScreen()],
      login: () => [const LoginScreen()],
      home: () => [const HomeScreen()],
      main: () => [const MainScreen()],
      homeDetail: (id) => [HomeDetailScreen(id: id)],
      profile: () => [const ProfileScreen()],
      editProfile: () => [const EditProfileScreen()],
      gallery: () => [const GalleryScreen()],
      settings: () => [const SettingsScreen()],
      resetPassword: (resetPasswordToken) =>
          [ResetPasswordScreen(resetPasswordToken: resetPasswordToken)],
    );
    if (widgets.isNotEmpty) pushAll(widgets);
  }

  /// support Web platform
  /// it is passed to [AppRouteInformationParser.restoreRouteInformation]
  @override
  AppPage? get currentConfiguration => super.currentConfiguration;

  @override
  get tag => 'AppNavigator';

  static AppNavigator of(BuildContext context) {
    return context.read<AppNavigator>();
  }
}
