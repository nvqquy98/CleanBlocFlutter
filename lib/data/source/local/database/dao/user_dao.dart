import '../model/local_image_url_data.dart';
import '../model/local_user_data.dart';
import 'package:injectable/injectable.dart';

import '../base_dao.dart';

@LazySingleton()
class UserDao extends BaseDao {
  int insertUser(LocalUserData user) {
    return box<LocalUserData>().put(user);
  }

  Stream<List<LocalUserData>> getUsers() {
    return box<LocalUserData>()
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  int deleteAllUsers() {
    box<LocalImageUrlData>().removeAll();
    return box<LocalUserData>().removeAll();
  }
}
