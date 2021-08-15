import 'dart:ui';

import '../../../domain/exception/remote_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecase/login_use_case.dart';
import '../../../shared/extensions.dart';
import '../../../shared/helper/validation/validator.dart';
import '../base/base_bloc.dart';

@Injectable()
class LoginBloc extends BaseBloc {
  final LoginUseCase _loginUseCase;

  /// Input
  late void Function(String) funcEmailChanged;
  late void Function(String) funcPasswordChanged;
  late VoidCallback funcSubmit;
  late Function(RemoteException) funcOnServerError;

  /// Output
  late Stream<String?> streamError;
  late Stream<bool> streamIsButtonLoginEnable;
  late Stream<void> streamLoginSuccess;

  /// handle logic
  LoginBloc(this._loginUseCase) {
    final _emailController = BehaviorSubject.seeded('')..disposeBy(disposeBag);
    final _passwordController = BehaviorSubject.seeded('')..disposeBy(disposeBag);
    final _submitController = PublishSubject<void>()..disposeBy(disposeBag);
    final _onServerErrorController = PublishSubject<String?>()..disposeBy(disposeBag);

    funcEmailChanged = _emailController.add;
    funcPasswordChanged = _passwordController.add;
    funcSubmit = () => _submitController.add(null);
    funcOnServerError = (RemoteException exception) =>
        _onServerErrorController.add(exception.firstServerErrorMessage);

    final Stream<String?> validationError = _submitController.stream.map((_) {
      final errors = Validator.validateEmail(_emailController.value);
      if (errors.isValid) {
        return null;
      } else {
        return errors.firstErrorMessage;
      }
    });

    streamIsButtonLoginEnable = Rx.combineLatest2(_emailController.stream,
        _passwordController.stream, (String a, String b) => a.isNotEmpty && b.isNotEmpty).share();

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
    }).mapTo(null);
  }

  /// use case
  Stream<void> _login(String email, String password) => executeFuture(
        _loginUseCase(email: email, password: password),
      );
}
