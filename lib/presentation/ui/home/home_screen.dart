import 'package:auto_route/auto_route.dart';
import '../resource/dimens/dimens.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/app_router.gr.dart';
import '../base/base_state.dart';
import '../main/main_bloc.dart';
import 'home_bloc.dart';
import '../../../shared/extensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseState<HomeScreen, HomeBloc> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _handleReselectTab();
  }

  void _handleReselectTab() {
    context.read<MainBloc>()
      ..streamReselectedTabIndex.listen((tab) {
        if (tab == BottomBarTabIndex.home.index) {
          if (AutoRouter.of(context).stack.length == 1)
            _scrollToTop();
          else
            AutoRouter.of(context).popUntilRoot();
        }
      }).disposeBy(disposeBag);
  }

  void _scrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(seconds: 2), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<int>(
            stream: context.read<MainBloc>().streamCounter,
            initialData: context.read<MainBloc>().streamCounter.values.firstOrNull,
            builder: (context, snapshot) {
              return Text('Counter = ${snapshot.data}');
            }),
        Expanded(
          child: ListView.builder(
              controller: _scrollController,
              itemCount: 100,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SizedBox(height: Dimens.h(50), child: Center(child: Text('$index'))),
                  onTap: () {
                    context.read<MainBloc>().funcIncreaseCounter(index);
                    AutoRouter.of(context).push(const HomeDetailScreenRoute());
                  },
                );
              }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
