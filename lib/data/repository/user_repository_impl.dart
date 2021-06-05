import 'package:injectable/injectable.dart';

import '../../domain/entity/token.dart';
import '../../domain/entity/unit.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../source/local/user_local_data_source.dart';
import '../source/remote/user_remote_data_source.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepositoryImpl(this._userRemoteDataSource, this._userLocalDataSource);

  @override
  Future<Unit> login(String email, String password) async {
    final tokenAndUser = await _userRemoteDataSource.login(email, password);
    await _saveTokenAndUser(tokenAndUser.item1, tokenAndUser.item2);
    return Unit();
  }

  @override
  Future<Unit> logout() async {
    await _userRemoteDataSource.logout();
    await _userLocalDataSource.clearAllUserInfo();
    return Unit();
  }

  @override
  Future<Unit> changePassword(String currentPassword, String newPassword) =>
      _userRemoteDataSource.changePassword(currentPassword, newPassword);

  @override
  Future<Unit> forgotPassword(String email) =>
      _userRemoteDataSource.forgotPassword(email);

  @override
  Future<User> getCurrentUser() => _userRemoteDataSource.getCurrentUser();

  @override
  Future<Unit> register(String nickname, String email, String password,
      String? gender, String? avatarFilePath) async {
    final tokenAndUser = await _userRemoteDataSource.register(
        nickname, email, password, gender, avatarFilePath);
    await _saveTokenAndUser(tokenAndUser.item1, tokenAndUser.item2);
    return Unit();
  }

  @override
  bool get isLoggedIn => _userLocalDataSource.isLoggedIn;

  Future<List<Object>> _saveTokenAndUser(Token token, User user) async {
    return Future.wait([
      _userLocalDataSource.saveIsLoggedIn(true),
      _userLocalDataSource.saveAccessToken(token.accessToken),
      _userLocalDataSource.saveRefreshToken(token.refreshToken),
      _userLocalDataSource.saveUserPreference(user)
    ]);
  }

  @override
  Stream<List<User>> getUsers() {
    return _userLocalDataSource.getUsers();
  }

  @override
  int deleteAllUsers() => _userLocalDataSource.deleteAllUsers();

  @override
  int insertUser(User user) => _userLocalDataSource.insertUser(user);

  @override
  User getUserPreference() => _userLocalDataSource.getUserPreference();

  @override
  Future<Unit> clearAllUserInfo() => _userLocalDataSource.clearAllUserInfo();

  @override
  Future<bool> saveDeviceToken(String deviceToken) =>
      _userLocalDataSource.saveDeviceToken(deviceToken);
}
