import '../../navigation/navigator/home_navigator.dart';
import '../../navigation/navigator/profile_navigator.dart';
import '../../navigation/navigator/settings_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../utils/log/log_utils.dart';
import '../../helper/firebase_messaging/firebase_messaging.dart';
import '../../navigation/navigator/app_navigator.dart';
import '../base/base_state_and_utils.dart';
import '../map/map_screen.dart';
import 'main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen, MainBloc> {
  final homeNavigator = HomeNavigator();
  final profileNavigator = ProfileNavigator();
  final settingsNavigator = SettingsNavigator();

  @override
  void initState() {
    super.initState();
    _triggerNotification();
  }

  void _triggerNotification() {
    final firebaseMessagingManager =
        GetIt.instance.get<FirebaseMessagingManager>();
    firebaseMessagingManager.requestPermission();
    firebaseMessagingManager.notification.listen((notification) {
      printKV(FirebaseMessagingManager.tag, 'onNewIntent: $notification');
      final routes = FirebaseMessagingUtils.parseNotification(notification);
      if (routes != null) {
        AppNavigator.of(context).pushAll(routes);
      }
    }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild main');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => bloc),
        ChangeNotifierProvider(create: (_) => homeNavigator),
        ChangeNotifierProvider(create: (_) => profileNavigator),
        ChangeNotifierProvider(create: (_) => settingsNavigator),
      ],
      child: SafeArea(
        child: StreamBuilder<int>(
            stream: bloc.bottomTabIndex,
            builder: (context, snapshot) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('AppBar Test Dark Mode'),
                ),
                body: IndexedStack(
                  index: snapshot.data ?? BottomBarTabIndex.home.index,
                  children: AppNavigator.of(context).createChildRouter(
                      [homeNavigator, profileNavigator, settingsNavigator]),
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
                  },
                  selectedItemColor: Colors.blue,
                  currentIndex: snapshot.data ?? BottomBarTabIndex.home.index,
                ),
              );
            }),
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
          AppNavigator.of(context)
              .push(MapScreen(mainBloc: context.read<MainBloc>()));
        },
      ),
    );
  }
}
