import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/reset_password/reset_password_screen.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: LoginScreen),
  CustomRoute(
      page: ResetPasswordScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 200),
  AutoRoute(page: HomeScreen),
])
class $AppRouter {}
