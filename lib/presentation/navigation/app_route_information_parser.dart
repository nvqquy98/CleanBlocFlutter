import '../../utils/log/log_utils.dart';

import '../helper/deeplink/deep_link.dart';

import 'app_pages.dart';
import 'package:flutter/material.dart';
import 'package:dartx/dartx.dart';

/// support Web platform
class AppRouteInformationParser extends RouteInformationParser<AppPage> {
  @override
  Future<AppPage> parseRouteInformation(
      RouteInformation routeInformation) async {
    printKV(tag, 'parseRouteInformation path=${routeInformation.location}');
    final unknownPage = const AppPage.unknown();

    if (routeInformation.location == null) {
      return unknownPage;
    }
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return unknownPage;
    }

    final path = '/${uri.pathSegments[0]}';
    switch (path) {
      case PagePrefixPath.loginOptions:
        return const AppPage.loginOptions();
      case PagePrefixPath.login:
        return const AppPage.login();
      case PagePrefixPath.main:
        return const AppPage.main();
      case PagePrefixPath.home:
        final id = int.tryParse(uri.pathSegments.elementAtOrNull(1) ?? '');
        if (id != null) {
          return AppPage.homeDetail(id);
        }

        return const AppPage.home();
      case PagePrefixPath.profile:
        return const AppPage.profile();
      case PagePrefixPath.editProfile:
        return const AppPage.editProfile();
      case PagePrefixPath.gallery:
        return const AppPage.gallery();
      case PagePrefixPath.resetPassword:
        final resetPasswordToken =
            uri.queryParameters[DeepLinkManager.token] ?? '';
        return AppPage.resetPassword(resetPasswordToken);
      case PagePrefixPath.settings:
        return const AppPage.settings();
      default:
        return const AppPage.initial();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppPage configuration) {
    printKV(tag, 'restoreRouteInformation configuration=$configuration');
    return configuration.when(
      unknown: () => null,
      initial: () => const RouteInformation(location: '/'),
      loginOptions: () =>
          const RouteInformation(location: PagePrefixPath.loginOptions),
      login: () => const RouteInformation(location: PagePrefixPath.login),
      home: () => const RouteInformation(location: PagePrefixPath.home),
      main: () => const RouteInformation(location: PagePrefixPath.main),
      homeDetail: (int id) => RouteInformation(
          location: _buildUrl(PagePrefixPath.home, pathSegments: ['$id'])),
      profile: () => const RouteInformation(location: PagePrefixPath.profile),
      editProfile: () =>
          const RouteInformation(location: PagePrefixPath.editProfile),
      gallery: () => const RouteInformation(location: PagePrefixPath.gallery),
      settings: () => const RouteInformation(location: PagePrefixPath.settings),
      resetPassword: (resetPasswordToken) => RouteInformation(
          location: _buildUrl(PagePrefixPath.resetPassword,
              queries: {DeepLinkManager.token: resetPasswordToken})),
    );
  }

  String _buildUrl(
    String pathPrefix, {
    List<String> pathSegments = const [],
    Map<String, String> queries = const {},
  }) {
    return '/$pathPrefix/${Uri(
      pathSegments: pathSegments,
      queryParameters: queries,
    ).toString()}';
  }

  static const tag = 'AppRouteInformationParser';
}
