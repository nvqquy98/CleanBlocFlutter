import 'package:flutter/material.dart';

import '../../ui/setting/settings_screen.dart';

import '../base/base_router_delegate.dart';
import 'package:provider/provider.dart';

class SettingsNavigator extends BaseRouterDelegate {
  SettingsNavigator() : super([const SettingsScreen()]);

  @override
  get tag => 'SettingsNavigator';

  static SettingsNavigator of(BuildContext context) {
    return context.read<SettingsNavigator>();
  }
}
