import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entity/unit.dart';
import '../base/base_bloc_and_utils.dart';

/// Demo shared data between screens in 2 different stack navigator that have different level.
/// Ex: EditProfile vs Gallery
@Injectable()
class ProfileSharedBloc extends BaseBloc {
  late void Function(int) sendData;
  late VoidCallback clearData;

  late ConnectableStream<int> data;

  ProfileSharedBloc() {
    final _controller = PublishSubject<int>()..disposeBy(disposeBag);
    final _clearDataController = PublishSubject<Unit>()..disposeBy(disposeBag);
    sendData = _controller.addSafely;
    clearData = () => _clearDataController.addSafely(Unit());

    data = Rx.merge([_controller.stream, _clearDataController.stream.mapTo(0)])
        .publishReplay(maxSize: 1)..connect();
  }
}
