import '../repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetHasLoginUseCase {
  final UserRepository _userRepository;

  const GetHasLoginUseCase(this._userRepository);

  bool call() => _userRepository.isLoggedIn;
}
