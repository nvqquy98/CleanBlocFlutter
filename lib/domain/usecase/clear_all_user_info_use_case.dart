import '../entity/unit.dart';
import 'package:injectable/injectable.dart';

import '../repository/user_repository.dart';

@Injectable()
class ClearAllUserInfoUseCase {
  final UserRepository _userRepository;

  const ClearAllUserInfoUseCase(this._userRepository);

  Future<Unit> call() => _userRepository.clearAllUserInfo();
}
