import '../navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../utils/logic_utils.dart';
import '../helper/deeplink/deep_link.dart';
import '../router/app_router_observer.dart';
import 'app_bloc.dart';
import 'base/base_state.dart';
import 'edit_profile/profile_shared_bloc.dart';
import 'login/login_screen.dart';
import 'main/main_screen.dart';
import 'reset_password/reset_password_screen.dart';
import 'resource/themes/app_themes.dart';

class MyApp extends StatefulWidget {
  final DeepLinkResult? deepLinkResult;

  const MyApp(this.deepLinkResult);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp, AppBloc> {
  final _appNavigator = AppNavigator();
  final _deepLinkManager = GetIt.instance.get<DeepLinkManager>();

  List<Widget> _parseDeepLinkResult() {
    final deepLinkResult = widget.deepLinkResult;
    if (deepLinkResult is ResetPasswordDeepLink) {
      return [
        ResetPasswordScreen(
            resetPasswordToken: deepLinkResult.resetPasswordToken)
      ];
    }

    return [_launcher];
  }

  Widget get _launcher =>
      bloc.isLoggedIn ? const MainScreen() : const LoginScreen();

  @override
  void initState() {
    super.initState();
    bloc.onClearAllUserInfoSuccess.listen((_) {
      _appNavigator.popAllAndPush(const LoginScreen());
    });

    _deepLinkManager.foregroundDeepLinkStream().listen((deepLinkResult) {
      if (deepLinkResult is ResetPasswordDeepLink) {
        _appNavigator.push(ResetPasswordScreen(
            resetPasswordToken: deepLinkResult.resetPasswordToken));
      }
    }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GetIt.instance.get<ProfileSharedBloc>()),
        Provider(create: (_) => _appNavigator),
      ],
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
              routerDelegate: _appNavigator.delegate(
                  initialPages: _parseDeepLinkResult(),
                  navigatorObservers: []),
              routeInformationParser: _appNavigator.routeInformationParser,
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
