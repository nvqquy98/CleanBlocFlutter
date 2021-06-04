import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/source/remote/api/error/http_request_exception.dart';
import '../../../domain/entity/unit.dart';
import '../../../domain/usecase/login_use_case.dart';
import '../../../utils/logic_utils.dart';
import '../../../utils/validation/validator.dart';
import '../base/base_bloc.dart';

@Injectable()
class LoginBloc extends BaseBloc {
  final LoginUseCase _loginUseCase;

  /// Input
  late void Function(String) funcEmailChanged;
  late void Function(String) funcPasswordChanged;
  late VoidCallback funcSubmit;
  late Function(HttpRequestException) funcOnServerError;

  /// Output
  late Stream<String?> streamError;
  late Stream<bool> streamIsButtonLoginEnable;
  late Stream<Unit> streamLoginSuccess;

  /// handle logic
  LoginBloc(this._loginUseCase) {
    final _emailController = BehaviorSubject.seeded('')
      ..disposeBy(disposeBag, '_emailController');
    final _passwordController = BehaviorSubject.seeded('')
      ..disposeBy(disposeBag, '_passwordController');
    final _submitController = PublishSubject<Unit>()
      ..disposeBy(disposeBag, '_submitController');
    final _onServerErrorController = PublishSubject<String?>()
      ..disposeBy(disposeBag, '_onServerErrorController');

    funcEmailChanged = (text) => _emailController.addSafely(text, '_emailController');
    funcPasswordChanged = _passwordController.addSafely;
    funcSubmit = () => _submitController.addSafely(Unit());
    funcOnServerError = (HttpRequestException exception) => _onServerErrorController
        .addSafely(exception.getFirstServerErrorMessage());

    final Stream<String?> validationError = _submitController.stream.map((_) {
      final errors = Validator.validateEmail(_emailController.value);
      if (errors.isValid) {
        return null;
      } else {
        return errors.firstErrorMessage;
      }
    });

    streamIsButtonLoginEnable = Rx.combineLatest2(
        _emailController.stream,
        _passwordController.stream,
        (String a, String b) => a.isNotEmpty && b.isNotEmpty).share();

    streamError = Rx.merge([
      _onServerErrorController.stream,
      validationError,
      streamIsButtonLoginEnable.mapTo(null),
    ]);

    streamLoginSuccess = validationError.flatMap((String? error) {
      if (error == null) {
        return _login(_emailController.value, _passwordController.value);
      } else {
        return const Stream.empty();
      }
    }).mapTo(Unit());
  }

  /// use case
  Stream<Unit> _login(String email, String password) =>
      executeFuture(_loginUseCase(email: email, password: password));
}
