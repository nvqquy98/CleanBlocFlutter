import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entity/unit.dart';
import '../../domain/usecase/clear_all_user_info_use_case.dart';
import '../../domain/usecase/get_has_login_use_case.dart';
import '../../domain/usecase/is_dark_mode_use_case.dart';
import '../../domain/usecase/save_is_dark_mode_use_case.dart';
import '../../utils/logic_utils.dart';
import 'base/base_bloc.dart';

@LazySingleton()
class AppBloc extends BaseBloc {
  final ClearAllUserInfoUseCase _clearAllUserInfoUseCase;
  final GetHasLoginUseCase _getHasLoginUseCase;
  final IsDarkModeUseCase _isDarkModeUseCase;
  final SaveIsDarkModeUseCase _saveIsDarkModeUseCase;

  /// Input
  late VoidCallback onClearAllUserInfo;
  late void Function(bool) changeTheme;

  /// Output
  late Stream<Unit> onClearAllUserInfoSuccess;
  late Stream<bool> isDarkModeStream;

  AppBloc(this._clearAllUserInfoUseCase, this._getHasLoginUseCase,
      this._isDarkModeUseCase, this._saveIsDarkModeUseCase) {
    final _clearAllUserInfoController = PublishSubject<Unit>()
      ..disposeBy(disposeBag);
    onClearAllUserInfo = () => _clearAllUserInfoController.addSafely(Unit());

    final _themeController = PublishSubject<bool>();
    changeTheme = (isDarkMode) {
      _saveIsDarkModeUseCase(isDarkMode)
          .then((_) => _themeController.addSafely(isDarkMode));
    };

    /// prevent spam
    isDarkModeStream =
        _themeController.stream.throttleTime(const Duration(milliseconds: 500));

    onClearAllUserInfoSuccess = _clearAllUserInfoController.stream
        .flatMap((_) => executeFuture(_clearAllUserInfoUseCase()));
  }

  bool get isLoggedIn => _getHasLoginUseCase();

  bool get isDarkMode => _isDarkModeUseCase();
}
