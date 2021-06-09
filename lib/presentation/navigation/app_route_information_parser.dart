import 'app_pages.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<AppPage> {
  @override
  Future<AppPage> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return const SplashPage();
    }
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return const SplashPage();
    }

    final path = '/${uri.pathSegments[0]}';
    switch(path) {
      case PagePrefixPath.splash:
        return const SplashPage();
      case PagePrefixPath.login:
        return const LoginPage();
      case PagePrefixPath.main:
        return const MainPage();
      case PagePrefixPath.home:
        return const HomePage();
      case PagePrefixPath.profile:
        return const ProfilePage();
      case PagePrefixPath.editProfile:
        return const EditProfilePage();
      case PagePrefixPath.gallery:
        return const GalleryPage();
      case PagePrefixPath.resetPassword:
        return const ResetPasswordPage();
      default:
        return const SplashPage();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppPage configuration) {
    return RouteInformation(location: configuration.path);
  }
}
