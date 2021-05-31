import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state_and_utils.dart';
import '../main/main_bloc.dart';
import 'map_bloc.dart';

class MapScreen extends StatefulWidget {
  final MainBloc mainBloc;

  const MapScreen({Key? key, required this.mainBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapScreenState();
  }
}

class MapScreenState extends BaseState<MapScreen, MapBloc> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.mainBloc,
      child: const Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: context.read<MainBloc>().streamCounter,
        initialData: context.read<MainBloc>().streamCounter.values.firstOrNull,
        builder: (context, snapshot) {
          return Text('Counter = ${snapshot.data}');
        });
  }
}
