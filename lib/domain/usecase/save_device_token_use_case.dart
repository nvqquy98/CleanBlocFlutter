import '../repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SaveDeviceTokenUseCase {
  final UserRepository _userRepository;

  SaveDeviceTokenUseCase(this._userRepository);

  Future<bool> call(String deviceToken) =>
      _userRepository.saveDeviceToken(deviceToken);
}
