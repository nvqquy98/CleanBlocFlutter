import 'package:flutter/material.dart';

import '../../ui/home/home_screen.dart';
import '../base/base_router_delegate.dart';
import 'package:provider/provider.dart';

class HomeNavigator extends BaseRouterDelegate {
  HomeNavigator() : super([const HomeScreen()]);

  @override
  get tag => 'HomeNavigator';

  static HomeNavigator of(BuildContext context) {
    return context.read<HomeNavigator>();
  }
}
