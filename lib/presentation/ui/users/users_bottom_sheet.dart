import '../gallery/gallery_screen.dart';

import '../../navigation/navigator/app_navigator.dart';

import '../home_detail/home_detail_bloc.dart';
import '../main/main_bloc.dart';
import 'users_bloc.dart';
import '../base/base_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UsersBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersBottomSheetState();
  }
}

class _UsersBottomSheetState extends BaseState<UsersBottomSheet, UsersBloc> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: context.read<HomeDetailBloc>().demoData,
            builder: (context, snapshot) {
              return Text('receive data from home detail ${snapshot.data}');
            }
          ),
          ElevatedButton(
              onPressed: () {
                context.read<HomeDetailBloc>().demoController.add(9999);
                AppNavigator.of(context).pop();
              },
              child: const Text('send data to home detail')),
          ElevatedButton(
              onPressed: () {
                AppNavigator.of(context).push(const GalleryScreen());
              },
              child: const Text('Go to gallery')),
          ElevatedButton(
              onPressed: () {
                  context.read<MainBloc>().funcResetCounter();
                  AppNavigator.of(context).pop();
              },
              child: const Text('Delete counter'))
        ]
    );
  }
}