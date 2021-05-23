import '../repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class IsDarkModeUseCase {
  final UserRepository _userRepository;

  IsDarkModeUseCase(this._userRepository);

  bool call() => _userRepository.isDarkMode;
}