import 'dart:async';

import 'package:flutter/material.dart';

import 'app_config.dart';
import 'build_config.dart';
import 'presentation/ui/app.dart';

Future<void> main() async {
  /// setup flavor
  BuildConfig.flavor = Flavor.production;

  /// other setup
  await AppConfig.setup();

  runZonedGuarded(() => runApp(MyApp()), (error, _) {
    // report error by sentry or firebase crashlytic
  });
}
