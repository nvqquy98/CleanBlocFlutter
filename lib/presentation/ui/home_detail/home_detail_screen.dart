import 'package:basecleanflutter/presentation/ui/custom_view/view_group/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state_and_utils.dart';
import '../main/main_bloc.dart';
import '../users/users_bottom_sheet.dart';
import 'home_detail_bloc.dart';
import 'package:dartx/dartx.dart';

class HomeDetailScreen extends StatefulWidget {
  final int id;

  const HomeDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends BaseState<HomeDetailScreen, HomeDetailBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: 'Home Detail', isCloseButton: false),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
                stream: bloc.demoController.stream,
                builder: (context, snapshot) {
                  return Text('call back from bottom sheet: ${snapshot.data}');
                }),
            StreamBuilder<int>(
                stream: context.read<MainBloc>().streamCounter,
                initialData:
                    context.read<MainBloc>().streamCounter.values.firstOrNull,
                builder: (context, snapshot) {
                  return Text('Counter = ${snapshot.data}');
                }),
            ElevatedButton(
                onPressed: () {
                  context.showBottomSheet((_) => ChangeNotifierProvider.value(
                      value: bloc, child: UsersBottomSheet()));
                },
                child: const Text('show bottom sheet'))
          ],
        ),
      ),
    );
  }
}
