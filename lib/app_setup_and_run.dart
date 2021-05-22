import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'di/di.dart';
import 'presentation/ui/app.dart';
import 'utils/deeplink/deep_link_manager.dart';

class App {
  static run() async {
    await _setup();
    runZonedGuarded(_runMyApp, _reportError);
  }

  static _setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// setup DI
    await configureInjection();

    /// config Equatable
    EquatableConfig.stringify = true;

    await SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  static _runMyApp() async {
    final deepLinkManager = GetIt.instance.get<DeepLinkManager>();
    final deepLinkResult =
        await deepLinkManager.getInitialDeepLink().catchError((e) => null);
    runApp(MyApp(deepLinkResult));
  }

  static _reportError(Object error, StackTrace stacktrace) {
    // report error by sentry or firebase crashlytic
  }
}
