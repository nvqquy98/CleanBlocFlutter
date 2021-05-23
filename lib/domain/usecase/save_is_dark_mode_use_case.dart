import '../repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SaveIsDarkModeUseCase {
  final UserRepository _userRepository;

  SaveIsDarkModeUseCase(this._userRepository);

  Future<bool> call(bool isDarkMode) =>
      _userRepository.saveIsDarkMode(isDarkMode);
}
