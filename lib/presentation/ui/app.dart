import 'package:auto_route/auto_route.dart';
import 'resource/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../utils/deeplink/deep_link_manager.dart';
import '../../utils/logic_utils.dart';
import '../router/app_router.gr.dart';
import '../router/app_router_observer.dart';
import 'app_bloc.dart';
import 'base/base_state.dart';
import 'edit_profile/profile_shared_bloc.dart';

class MyApp extends StatefulWidget {
  final DeepLinkResult? deepLinkResult;

  const MyApp(this.deepLinkResult);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp, AppBloc> {
  final _appRouter = AppRouter();
  final _deepLinkManager = GetIt.instance.get<DeepLinkManager>();

  List<PageRouteInfo> _parseDeepLinkResult() {
    final deepLinkResult = widget.deepLinkResult;
    if (deepLinkResult is ResetPasswordDeepLink) {
      return [
        ResetPasswordScreenRoute(
            resetPasswordToken: deepLinkResult.resetPasswordToken)
      ];
    }

    return [_launcher];
  }

  PageRouteInfo get _launcher =>
      bloc.isLoggedIn ? const MainScreenRoute() : const LoginScreenRoute();

  @override
  void initState() {
    super.initState();
    bloc.onClearAllUserInfoSuccess.listen((_) {
      _appRouter.replaceAll([const LoginScreenRoute()]);
    });

    _deepLinkManager.foregroundDeepLinkStream().listen((deepLinkResult) {
      if (deepLinkResult is ResetPasswordDeepLink) {
        _appRouter.push(ResetPasswordScreenRoute(
            resetPasswordToken: deepLinkResult.resetPasswordToken));
      }
    }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.instance.get<ProfileSharedBloc>(),
      child: StreamBuilder<bool>(
          initialData: bloc.isDarkMode,
          stream: bloc.isDarkModeStream,
          builder: (context, snapshot) {
            return MaterialApp.router(
              title: 'Base Clean Flutter',
              debugShowCheckedModeBanner: false,
              darkTheme: AppThemes.darkTheme,
              themeMode:
                  snapshot.data == true ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.lightTheme,
              routerDelegate: _appRouter.delegate(
                  initialRoutes: _parseDeepLinkResult(),
                  navigatorObservers: () => [AppRouterObserver(context)]),
              routeInformationParser: _appRouter.defaultRouteParser(),
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                if (deviceLocale != null &&
                    supportedLocales.contains(deviceLocale)) {
                  return deviceLocale;
                } else {
                  return const Locale('en', 'US');
                }
              },
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,

                /// Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,

                /// Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,

                /// Built-in localization of basic text for Cupertino widgets
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          }),
    );
  }
}
