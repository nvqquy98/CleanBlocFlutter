import 'package:injectable/injectable.dart';

import '../entity/unit.dart';
import '../repository/user_repository.dart';

@Injectable()
class LogoutUseCase {
  final UserRepository _userRepository;

  const LogoutUseCase(this._userRepository);

  Future<Unit> call() => Future.value(Unit());
}
