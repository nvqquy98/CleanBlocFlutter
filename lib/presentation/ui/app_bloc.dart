import 'dart:async';

import '../../domain/usecase/get_has_login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entity/unit.dart';
import '../../domain/usecase/clear_all_user_info_use_case.dart';
import '../../utils/utils.dart';
import 'base/base_bloc.dart';

/// it help rebuild all widget tree
/// useful for change theme or change language in app
@LazySingleton()
class AppBloc extends BaseBloc {
  final ClearAllUserInfoUseCase _clearAllUserInfoUseCase;
  final GetHasLoginUseCase _getHasLoginUseCase;

  /// Input
  late VoidCallback onClearAllUserInfo;

  /// Output
  late Stream<Unit> onClearAllUserInfoSuccess;

  AppBloc(this._clearAllUserInfoUseCase, this._getHasLoginUseCase) {
    final _clearAllUserInfoController = PublishSubject<Unit>()
      ..disposeBy(disposeBag);
    onClearAllUserInfo = () => _clearAllUserInfoController.add(Unit());

    onClearAllUserInfoSuccess = _clearAllUserInfoController.stream
        .flatMap((_) => executeFuture(_clearAllUserInfoUseCase()));
  }

  bool get isLoggedIn {
    return _getHasLoginUseCase();
  }
}
