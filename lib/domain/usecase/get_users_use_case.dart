import 'package:injectable/injectable.dart';

import '../entity/user.dart';
import '../repository/user_repository.dart';

@Injectable()
class GetUsersUseCase {
  final UserRepository _userRepository;

  const GetUsersUseCase(this._userRepository);

  Stream<List<User>> call() => _userRepository.getUsers();
}
