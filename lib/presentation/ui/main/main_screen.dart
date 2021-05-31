import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/app_router.gr.dart';
import '../base/base_state.dart';
import 'main_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen, MainBloc> {
  List<PageRouteInfo<dynamic>> pageList = <PageRouteInfo<dynamic>>[
    const BottomTabHomeRouter(),
    const BottomTabProfileRouter(),
    const BottomTabSettingsRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('AppBar Test Dark Mode'),),
          body: Stack(
            children: [
              AutoTabsRouter(
                routes: pageList,
                builder: (context, child, animation) {
                  final tabsRouter = context.tabsRouter;
                  return Scaffold(
                    body: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => bloc.funcIncreaseCounter(1),
                      child: const Icon(Icons.add),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      items: [
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.people), label: 'Profile'),
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: 'Settings'),
                      ],
                      onTap: (index) {
                        bloc.funcOnBottomSheetTabTap(index);
                        tabsRouter.setActiveIndex(index);
                      },
                      selectedItemColor: Colors.blue,
                      currentIndex: tabsRouter.activeIndex,
                    ),
                  );
                },
              ),
              GoToMapButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class GoToMapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        child: const Text('go to map'),
        onPressed: () {
          AutoRouter.of(context)
              .push(MapScreenRoute(mainBloc: context.read<MainBloc>()));
        },
      ),
    );
  }
}
