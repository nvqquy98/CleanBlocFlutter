import 'package:injectable/injectable.dart';

import '../entity/unit.dart';
import '../repository/user_repository.dart';

@Injectable()
class LoginUseCase {
  final UserRepository _userRepository;

  const LoginUseCase(this._userRepository);

  Future<Unit> call({required String email, required String password}) =>
      Future.delayed(const Duration(seconds: 2), () => Unit());
}
