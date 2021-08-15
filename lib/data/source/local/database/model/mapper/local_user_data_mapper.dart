import 'package:injectable/injectable.dart';

import '../local_user_data.dart';
import '../../../../../../domain/entity/user.dart';

import 'base/base_local_data_mapper.dart';

@Injectable()
class LocalUserDataMapper extends BaseLocalDataMapper<LocalUserData, User>
    with LocalDataMapperMixin {
  @override
  User mapToEntity(LocalUserData data) {
    return User(id: data.id, email: data.email, nickname: data.nickname);
  }

  @override
  LocalUserData mapToLocalData(User entity) {
    return LocalUserData(id: entity.id, email: entity.email, nickname: entity.nickname);
  }
}
