import 'package:auto_route/auto_route.dart';
import '../resource/dimens/dimens.dart';
import '../app_bloc.dart';
import 'package:get_it/get_it.dart';
import '../base/base_state.dart';
import 'settings_bloc.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../router/app_router.gr.dart';
import '../../../shared/extensions.dart';

class SettingsScreen extends StatefulWidget {
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
        AutoRouter.of(context).replace(const LoginScreenRoute());
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
                      value: snapshot.data == true, onChanged: _appBloc.changeTheme);
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
            SizedBox(height: Dimens.h(16)),
            ElevatedButton(
              onPressed: bloc.queueApiClick,
              child: const Text('queue api'),
            ),
            SizedBox(height: Dimens.h(16)),
            ElevatedButton(
              onPressed: bloc.nonCancelApiClick,
              child: const Text('non cancel api'),
            ),
            SizedBox(height: Dimens.h(16)),
            ElevatedButton(
              onPressed: bloc.cancelLateClick,
              child: const Text('cancel late api'),
            ),
            SizedBox(height: Dimens.h(16)),
            ElevatedButton(
              onPressed: bloc.clearTextClick,
              child: const Text('clear text'),
            ),
            SizedBox(height: Dimens.h(16)),
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
