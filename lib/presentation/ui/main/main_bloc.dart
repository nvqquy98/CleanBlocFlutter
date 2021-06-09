import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entity/unit.dart';
import '../../../utils/logic_utils.dart';
import '../base/base_bloc.dart';

/// Demo shared data between screens in a stack navigator. Ex: Home vs HomeDetail
/// Shared data between screens in 2 different stack navigator that have same level. Ex: Home vs Profile
@Injectable()
class MainBloc extends BaseBloc {
  /// input
  late void Function(int) funcOnBottomSheetTabTap;
  late void Function(int) funcIncreaseCounter;
  late VoidCallback funcResetCounter;

  /// output
  late Stream<int> streamReselectedTabIndex;
  late ValueStream<int> bottomTabIndex;
  late ReplayStream<int> streamCounter;

  MainBloc() {
    /// controller
    final _onBottomSheetTabController =
        BehaviorSubject.seeded(BottomBarTabIndex.home.index)
          ..disposeBy(disposeBag);
    final _increaseCounterController = BehaviorSubject.seeded(0)
      ..disposeBy(disposeBag);
    final _resetCounterController = PublishSubject<Unit>()
      ..disposeBy(disposeBag);

    /// assign input func
    funcOnBottomSheetTabTap = _onBottomSheetTabController.addSafely;
    funcIncreaseCounter = _increaseCounterController.addSafely;
    funcResetCounter = () => _resetCounterController.addSafely(Unit());

    /// build output stream
    bottomTabIndex = _onBottomSheetTabController.stream;
    streamReselectedTabIndex =
        buildStreamReselectedTabIndex(_onBottomSheetTabController.stream);
    streamCounter = buildStreamCounter(
        _increaseCounterController.stream, _resetCounterController.stream);
  }

  Stream<int> buildStreamReselectedTabIndex(Stream<int> bottomSheetTabIndex) =>
      bottomSheetTabIndex.pairwise().flatMap<int>((event) {
        if (event.first == event.last) {
          return Stream.value(event.first);
        } else {
          return const Stream.empty();
        }
      }).share();

  ReplayStream<int> buildStreamCounter(
          Stream<int> increaseCounter, Stream<Unit> resetCounter) =>
      Rx.merge<int?>([
        increaseCounter.scan<int>(
            (accumulated, value, index) => accumulated + value, 0),
        resetCounter.mapTo(null)
      ]).map((event) {
        if (event == null)
          return 0;
        else
          return event;
      }).shareReplay(maxSize: 1);
}

enum BottomBarTabIndex { home, profile, settings }
