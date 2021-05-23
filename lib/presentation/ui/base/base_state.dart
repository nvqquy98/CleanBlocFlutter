import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

import '../../../data/source/local/preference/error/shared_pref_exception.dart';
import '../../../data/source/remote/api/error/http_request_exception.dart';
import '../../../data/source/remote/api/error/parse_json_exception.dart';
import '../../../data/source/remote/api/error/server_error_constants.dart';
import '../../../generated/l10n.dart';
import '../../../utils/logic_utils.dart';
import '../../../utils/view_utils.dart';
import '../app_bloc.dart';
import 'base_bloc.dart';

abstract class BaseState<T extends StatefulWidget, Bloc extends BaseBloc>
    extends State<T> {
  final Bloc bloc = GetIt.instance.get<Bloc>();
  final disposeBag = DisposeBag();
  final _errorVisibleDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    bloc
      ..errorStream
          .throttleTime(_errorVisibleDuration)
          .listen(handleError)
          .disposeBy(disposeBag)
      ..loadingStream.scan<Tuple2<int, bool>>((accumulated, value, _) {
        if (value)
          return Tuple2(accumulated.item1 + 1, value);
        else
          return Tuple2(accumulated.item1 - 1, value);
      }, const Tuple2(0, false)).listen(
        (loadingCounts) {
          if (loadingCounts.item1 == 1 && loadingCounts.item2) {
            showLoading();
          } else if (loadingCounts.item1 <= 0 && !loadingCounts.item2) {
            hideLoading();
          }
        },
      ).disposeBy(disposeBag);
  }

  @override
  void dispose() {
    disposeBag.dispose();
    bloc.closeStream();
    super.dispose();
  }

  void handleError(Object error) {
    if (error is HttpRequestException) {
      switch (error.kind) {
        case HttpRequestExceptionKind.server:
          switch (error.getFirstServerErrorCode()) {
            case ServerErrorCode.invalidRefreshToken:
            case ServerErrorCode.accountHasDeleted:
            case ServerErrorCode.multipleDeviceLogin:

              /// force logout
              context.showAlertDialog(
                  error.getFirstServerErrorMessage() ??
                      S.of(context).unexpected_error, () {
                GetIt.instance.get<AppBloc>().onClearAllUserInfo();
              });
              break;
            default:
              onServerError(error);
              break;
          }

          break;
        case HttpRequestExceptionKind.http:
          if (error.isServerDownError) {
            showErrorSnackBar(S.of(context).server_down_error);
          } else {
            showErrorSnackBar(S.of(context).unexpected_error);
          }
          break;
        case HttpRequestExceptionKind.noInternet:
          showErrorSnackBar(S.of(context).check_connection);
          break;
        case HttpRequestExceptionKind.network:
          showErrorSnackBar(S.of(context).server_problem_try_later);
          break;
        case HttpRequestExceptionKind.timeout:
          showErrorSnackBar(S.of(context).check_connection);
          break;
        case HttpRequestExceptionKind.cancellation:
          break;
        case HttpRequestExceptionKind.unexpected:
          showErrorSnackBar(S.of(context).unexpected_error);
          break;
      }
    } else if (error is SharedPrefException) {
      showErrorSnackBar(S.of(context).unexpected_error);
    } else if (error is ParseJsonException) {
      showErrorSnackBar(S.of(context).unexpected_error);
    } else {
      showErrorSnackBar(S.of(context).unexpected_error);
    }
  }

  void showErrorSnackBar(String message) {
    context.showSnackBar(message, _errorVisibleDuration);
  }

  void onServerError(HttpRequestException exception) {
    final message = exception.getFirstServerErrorMessage() ??
        S.of(context).unexpected_error;
    showErrorSnackBar(message);
  }

  void showLoading() {
    context.showLoading();
  }

  void hideLoading() {
    AutoRouter.of(context).root.pop();
  }
}
