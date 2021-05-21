import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../utils/utils.dart';
import '../../router/app_router.gr.dart';
import '../base/base_screen.dart';
import 'home_bloc.dart';

class HomeScreen extends BaseScreen {
  final bool isFromLogin;

  const HomeScreen({this.isFromLogin = false});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseState<HomeScreen, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc
      ..logoutSuccess.listen((event) {
        AutoRouter.of(context).replace(const LoginScreenRoute());
      }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<String>(
                stream: bloc.testResult,
                builder: (context, snapshot) {
                  return Text((snapshot.hasData ? snapshot.data : '')!);
                }),
            ElevatedButton(
              onPressed: bloc.cancelPreviousApiClick,
              child: const Text('cancel previous'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bloc.queueApiClick,
              child: const Text('queue api'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bloc.nonCancelApiClick,
              child: const Text('non cancel api'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bloc.cancelLateClick,
              child: const Text('cancel late api'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bloc.clearTextClick,
              child: const Text('clear text'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bloc.logout,
              child: Text(S.of(context).logout),
            )
          ],
        ),
      ),
    );
  }
}
