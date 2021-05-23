import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import '../ui/map/map_screen.dart';
import '../ui/setting/settings_screen.dart';

import '../ui/edit_profile/edit_profile_screen.dart';
import '../ui/gallery/gallery_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/home_detail/home_detail_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/main/main_screen.dart';
import '../ui/profile/profile_screen.dart';
import '../ui/reset_password/reset_password_screen.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: LoginScreen),
  CustomRoute(
      page: ResetPasswordScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 200),
  mainScreenRouter,
  AutoRoute(page: GalleryScreen),
  AutoRoute(page: MapScreen),
])
class $AppRouter {}

const mainScreenRouter = AutoRoute(
  page: MainScreen,
  children: [
    AutoRoute(
      name: 'BottomTabHomeRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(page: HomeScreen, initial: true),
        AutoRoute(page: HomeDetailScreen),
      ],
    ),
    AutoRoute(
      name: 'BottomTabProfileRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(page: ProfileScreen, initial: true),
        AutoRoute(page: EditProfileScreen),
      ],
    ),
    AutoRoute(
      name: 'BottomTabSettingsRouter',
      page: EmptyRouterPage,
      children: [AutoRoute(page: SettingsScreen, initial: true)],
    )
  ],
);
