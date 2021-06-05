
import '../entity/unit.dart';
import '../entity/user.dart';

abstract class UserRepository {
  Future<Unit> login(String email, String password);

  Future<Unit> logout();

  Future<User> getCurrentUser();

  Future<Unit> changePassword(String currentPassword, String newPassword);

  Future<Unit> forgotPassword(String email);

  Future<Unit> register(
      String nickname,
      String email,
      String password,
      String? gender,
      String? avatarFilePath);

  bool get isLoggedIn;

  Stream<List<User>> getUsers();

  int deleteAllUsers();

  int insertUser(User user);

  User getUserPreference();

  Future<Unit> clearAllUserInfo();

  Future<bool> saveDeviceToken(String deviceToken);
}
