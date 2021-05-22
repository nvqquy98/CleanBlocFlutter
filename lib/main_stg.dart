import 'dart:async';

import 'app_setup_and_run.dart';
import 'build_config.dart';

Future<void> main() async {
  /// setup flavor
  BuildConfig.flavor = Flavor.staging;

  /// run app
  await App.run();
}
