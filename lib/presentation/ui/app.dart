import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';
import '../../utils/app_color.dart';
import '../../utils/deeplink/deep_link_manager.dart';
import '../../utils/utils.dart';
import '../router/app_router.gr.dart';
import '../router/app_router_observer.dart';
import 'app_bloc.dart';
import 'base/base_screen.dart';
import 'splash/splash_screen.dart';

class MyApp extends BaseScreen {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp, AppBloc> {
  final _appRouter = AppRouter();
  final _title = 'Base Clean Flutter';
  final _theme = ThemeData(
    primaryColor: AppColors.pacificBlue,
  );

  @override
  void initState() {
    super.initState();
    appBloc.onClearAllUserInfoSuccess.listen((_) {
      _appRouter.replaceAll([const LoginScreenRoute()]);
    }).disposeBy(disposeBag);
    appBloc.foregroundDeepLinkStream().listen((deepLinkResult) {
      if (deepLinkResult is ResetPasswordDeepLink) {
        _appRouter.push(ResetPasswordScreenRoute(
            resetPasswordToken: deepLinkResult.resetPasswordToken));
      }
    });
  }

  List<PageRouteInfo> _parseDeepLinkResult(
      AsyncSnapshot<DeepLinkResult> snapshot) {
    if (snapshot.hasError) {
      return [_launcher];
    } else {
      final DeepLinkResult? deepLinkResult = snapshot.data;
      if (deepLinkResult is ResetPasswordDeepLink) {
        return [
          const LoginScreenRoute(),
          ResetPasswordScreenRoute(
              resetPasswordToken: deepLinkResult.resetPasswordToken)
        ];
      }
      return [_launcher];
    }
  }

  PageRouteInfo get _launcher =>
      (appBloc.isLoggedIn ? HomeScreenRoute() : const LoginScreenRoute())
          as PageRouteInfo;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DeepLinkResult>(
        stream: appBloc.initialDeepLinkStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              title: _title,
              debugShowCheckedModeBanner: false,
              theme: _theme,
              key: const ValueKey(0),

              /// force rebuild MaterialApp
              home: SplashScreen(),

              /// secondary splash
            );
          }
          return MaterialApp.router(
            title: _title,
            debugShowCheckedModeBanner: false,
            theme: _theme,
            routerDelegate: _appRouter.delegate(
                initialRoutes: _parseDeepLinkResult(snapshot),
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
        });
  }
}
