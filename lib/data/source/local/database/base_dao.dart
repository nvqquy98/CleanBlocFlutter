import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';

import 'database_api.dart';

class BaseDao {
  final DatabaseApi _databaseApi = GetIt.instance.get<DatabaseApi>();

  void close() => _databaseApi.store.close();

  Box<T> box<T>() => _databaseApi.store.box<T>();
}