import 'model/local_image_url_data.dart';

import 'model/local_user_data.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@LazySingleton()
class DatabaseApi {
  final Store _store;

  DatabaseApi(this._store);

  void close() {
    _store.close();
  }

  /// implement all database logic or separate into DAOs
  int insertUser(LocalUserData user) {
    return _store.box<LocalUserData>().put(user);
  }

  Stream<List<LocalUserData>> getUsers() {
    return _store
        .box<LocalUserData>()
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  int deleteAllUsers() {
    _store.box<LocalImageUrlData>().removeAll();
    return _store.box<LocalUserData>().removeAll();
  }
}
