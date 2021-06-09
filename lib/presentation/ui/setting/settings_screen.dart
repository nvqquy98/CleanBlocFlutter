import '../../navigation/app_navigator.dart';
import '../login/login_screen.dart';

import '../app_bloc.dart';
import 'package:get_it/get_it.dart';
import '../base/base_state_and_utils.dart';
import 'settings_bloc.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends BaseState<SettingsScreen, SettingsBloc> {
  final _appBloc = GetIt.instance.get<AppBloc>();

  @override
  void initState() {
    super.initState();
    bloc
      ..logoutSuccess.listen((event) {
        AppNavigator.of(context).popAllAndPush(const LoginScreen());
      }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            StreamBuilder<bool>(
                initialData: _appBloc.isDarkMode,
                stream: _appBloc.isDarkModeStream,
                builder: (context, snapshot) {
                  return Switch.adaptive(
                      value: snapshot.data == true,
                      onChanged: _appBloc.changeTheme);
                }),
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
