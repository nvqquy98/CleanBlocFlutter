import 'package:basecleanflutter/presentation/ui/edit_profile/edit_profile_screen.dart';

import '../../navigation/app_navigator.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state_and_utils.dart';
import '../main/main_bloc.dart';
import 'profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen, ProfileBloc> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>()
      ..streamReselectedTabIndex.listen((tab) {
        if (tab == BottomBarTabIndex.profile.index) {
          if (AppNavigator.of(context).stack.length > 1)
            AppNavigator.of(context).popUntilRoot();
        }
      }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              AppNavigator.of(context).push(const EditProfileScreen());
            },
            child: const Text('Go to edit'),
          ),
          StreamBuilder<int>(
              stream: context.read<MainBloc>().streamCounter,
              initialData:
                  context.read<MainBloc>().streamCounter.values.firstOrNull,
              builder: (context, snapshot) {
                return Text('Counter = ${snapshot.data}');
              }),
          ElevatedButton(
            onPressed: () => context.read<MainBloc>().funcIncreaseCounter(1),
            child: const Text('Increase Counter'),
          ),
        ],
      ),
    );
  }
}
