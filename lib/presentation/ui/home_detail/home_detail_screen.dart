import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state.dart';
import '../../../shared/extensions.dart';
import '../main/main_bloc.dart';
import '../users/users_bottom_sheet.dart';
import 'home_detail_bloc.dart';
import 'package:dartx/dartx.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends BaseState<HomeDetailScreen, HomeDetailBloc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<int>(
              stream: bloc.demoController.stream,
              builder: (context, snapshot) {
                return Text('call back from bottom sheet: ${snapshot.data}');
              }),
          StreamBuilder<int>(
              stream: context.read<MainBloc>().streamCounter,
              initialData: context.read<MainBloc>().streamCounter.values.firstOrNull,
              builder: (context, snapshot) {
                return Text('Counter = ${snapshot.data}');
              }),
          ElevatedButton(
              onPressed: () {
                context.showBottomSheet(
                    (_) => ChangeNotifierProvider.value(value: bloc, child: UsersBottomSheet()));
              },
              child: const Text('show bottom sheet'))
        ],
      ),
    );
  }
}
