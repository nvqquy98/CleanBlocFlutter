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
  late void Function(String) emailChanged;
  late void Function(String) passwordChanged;
  late VoidCallback submit;
  late Function(HttpRequestException) onServerError;

  /// Output
  late Stream<String?> error;
  late Stream<bool> isButtonLoginEnable;
  late Stream<Unit> loginSuccess;

  /// handle logic
  LoginBloc(this._loginUseCase) {
    final _emailController = BehaviorSubject.seeded('')..disposeBy(disposeBag);
    final _passwordController = BehaviorSubject.seeded('')
      ..disposeBy(disposeBag);
    final _submitController = PublishSubject<Unit>()..disposeBy(disposeBag);
    final _onServerErrorController = PublishSubject<String?>()
      ..disposeBy(disposeBag);

    emailChanged = _emailController.addSafely;
    passwordChanged = _passwordController.addSafely;
    submit = () => _submitController.addSafely(Unit());
    onServerError = (HttpRequestException exception) =>
        _onServerErrorController.addSafely(exception.getFirstServerErrorMessage());

    final Stream<String?> validationError = _submitController.stream.map((_) {
      final errors = Validator.validateEmail(_emailController.value);
      if (errors.isValid) {
        return null;
      } else {
        return errors.firstErrorMessage;
      }
    });

    isButtonLoginEnable = Rx.combineLatest2(
        _emailController.stream,
        _passwordController.stream,
        (String a, String b) => a.isNotEmpty && b.isNotEmpty).share();

    error = Rx.merge([
      _onServerErrorController.stream,
      validationError,
      isButtonLoginEnable.mapTo(null),
    ]);

    loginSuccess = validationError
        .flatMap((String? error) {
          if (error == null) {
            return _login(_emailController.value, _passwordController.value);
          } else {
            return const Stream.empty();
          }
        })
        .mapTo(Unit());
  }

  /// use case
  Stream<Unit> _login(String email, String password) =>
      executeFuture(_loginUseCase(email: email, password: password));
}
