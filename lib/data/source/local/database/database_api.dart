import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@LazySingleton()
class DatabaseApi {
  final Store store;

  DatabaseApi(this.store);
}
