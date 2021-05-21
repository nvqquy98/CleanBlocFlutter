import 'package:flutter/material.dart';
import 'app_config.dart';
import 'build_config.dart';
import 'presentation/ui/app.dart';

Future<void> main() async {
  /// setup flavor
  BuildConfig.flavor = Flavor.develop;

  /// other setup
  await AppConfig.setup();

  runApp(MyApp());
}