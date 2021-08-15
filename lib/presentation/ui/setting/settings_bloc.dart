import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entity/unit.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/usecase/get_current_user_use_case.dart';
import '../../../domain/usecase/logout_use_case.dart';
import '../base/base_bloc.dart';
import '../../../shared/extensions.dart';

@Injectable()
class SettingsBloc extends BaseBloc {
  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  late Function() queueApiClick;
  late Function() cancelPreviousApiClick;
  late Function() nonCancelApiClick;
  late Function() cancelLateClick;
  late Function() logout;
  late Function() clearTextClick;

  late Stream<void> logoutSuccess;

  late Stream<String> testResult;

  /// no ignore any click event, 3 click - call api 3 times sequentially
  late Stream<User> queueUser;

  /// cancel previous click event when the new click event was emitted
  late Stream<User> cancelPreviousUser;

  /// no ignore any click event, 3 click - call api 3 times in parallel
  late Stream<User> nonCancelUser;

  /// wait current api done, ignore all click event when api was processing
  late Stream<User> cancelLateUser;

  SettingsBloc(this._logoutUseCase, this._getCurrentUserUseCase) {
    final _logoutController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _queueApiController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _cancelPreviousController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _nonCancelController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _cancelLateController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _clearTextController = PublishSubject<Unit>()..disposeBy(disposeBag);

    logout = () => _logoutController.add(Unit());
    queueApiClick = () => _queueApiController.add(Unit());
    cancelPreviousApiClick = () => _cancelPreviousController.add(Unit());
    nonCancelApiClick = () => _nonCancelController.add(Unit());
    cancelLateClick = () => _cancelLateController.add(Unit());
    clearTextClick = () => _clearTextController.add(Unit());

    queueUser = _queueApiController.stream.asyncExpand((_) => _getCurrentUser()).log('queueUser');
    cancelPreviousUser = _cancelPreviousController.stream
        .switchMap((_) => _getCurrentUser())
        .log('cancelPreviousUser');
    nonCancelUser =
        _nonCancelController.stream.flatMap((_) => _getCurrentUser()).log('nonCancelUser');
    cancelLateUser =
        _cancelLateController.stream.exhaustMap((_) => _getCurrentUser()).log('cancelLateUser');

    testResult = Rx.merge([
      queueUser.mapTo('queue success'),
      cancelPreviousUser.mapTo('cancel previous success'),
      nonCancelUser.mapTo('non cancel success'),
      cancelLateUser.mapTo('cancel late success'),
      _clearTextController.stream.mapTo(''),
    ]).scan<String>((accumulated, value, _) {
      if (value.isEmpty) {
        return '';
      } else {
        return '$accumulated${accumulated.isEmpty ? '' : '\n'}$value';
      }
    }, '').log('testResult');

    logoutSuccess = _logoutController.stream
        .flatMap((_) => executeFuture(_logoutUseCase()))
        .log('logoutSuccess');
  }

  Stream<User> _getCurrentUser() => executeFuture(_getCurrentUserUseCase());
}
