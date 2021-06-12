import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/profile/profile_screen.dart';
import '../base/base_router_delegate.dart';

class ProfileNavigator extends BaseRouterDelegate {
  ProfileNavigator() : super([const ProfileScreen()]);

  @override
  get tag => 'ProfileNavigator';

  static ProfileNavigator of(BuildContext context) {
    return context.read<ProfileNavigator>();
  }
}
