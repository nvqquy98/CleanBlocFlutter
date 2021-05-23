import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/app_router.gr.dart';
import '../base/base_state_and_utils.dart';
import '../main/main_bloc.dart';
import 'profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen, ProfileBloc> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>()
      ..isReselectTab.listen((tab) {
        if (tab == BottomBarTabIndex.profile.index) {
          if (AutoRouter.of(context).stack.length > 1)
            AutoRouter.of(context).popUntilRoot();
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
              AutoRouter.of(context).push(const EditProfileScreenRoute());
            },
            child: const Text('Go to edit'),
          ),
          StreamBuilder<int>(
              stream: context.read<MainBloc>().counter,
              builder: (context, snapshot) {
                return Text('Counter = ${snapshot.data}');
              }),
          ElevatedButton(
            onPressed: context.read<MainBloc>().increaseCounter,
            child: const Text('Increase Counter'),
          ),
        ],
      ),
    );
  }
}
