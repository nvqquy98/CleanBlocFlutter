import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';
import '../../../shared/extensions.dart';

/// Demo shared data between screens in 2 different stack navigator that have different level.
/// Ex: EditProfile vs Gallery
@Injectable()
class ProfileSharedBloc extends BaseBloc {
  late BehaviorSubject<int> _dataController;

  void setData(int data) => _dataController.add(data);

  get streamData => _dataController.stream;

  ProfileSharedBloc() {
    _dataController = BehaviorSubject.seeded(0)..disposeBy(disposeBag);
  }
}
