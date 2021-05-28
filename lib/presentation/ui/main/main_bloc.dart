import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/logic_utils.dart';
import '../base/base_bloc.dart';

/// Demo shared data between screens in a stack navigator. Ex: Home vs HomeDetail
/// Shared data between screens in 2 different stack navigator that have same level. Ex: Home vs Profile
@Injectable()
class MainBloc extends BaseBloc {
  /// input
  late void Function(int) onBottomSheetTabTap;

  final _counterController = BehaviorSubject.seeded(0);

  /// output
  late Stream<int> isReselectTab;
  late Stream<int> counter;

  MainBloc() {
    final _onBottomSheetTabController =
        BehaviorSubject.seeded(BottomBarTabIndex.home.index)
          ..disposeBy(disposeBag);
    onBottomSheetTabTap = _onBottomSheetTabController.addSafely;
    isReselectTab =
        _onBottomSheetTabController.stream.pairwise().flatMap<int>((event) {
      if (event.first == event.last) {
        return Stream.value(event.first);
      } else {
        return const Stream.empty();
      }
    }).share();

    counter = _counterController.stream.shareReplay(maxSize: 1);
  }

  void increaseCounter({int value = 1}) {
    _counterController.addSafely(_counterController.value + value);
  }

  void resetCounter() {
    _counterController.addSafely(0);
  }

  @override
  void closeStream() {
    _counterController.close();
    super.closeStream();
  }
}

enum BottomBarTabIndex { home, profile, settings }
