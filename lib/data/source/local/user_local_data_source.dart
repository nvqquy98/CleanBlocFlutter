import 'database/dao/user_dao.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/user.dart';
import 'database/model/local_image_url_data.dart';
import 'database/model/mapper/local_image_url_data_mapper.dart';
import 'database/model/mapper/local_user_data_mapper.dart';
import 'preference/app_preferences.dart';
import 'preference/model/mapper/preference_user_data_mapper.dart';

@LazySingleton()
class UserLocalDataSource {
  final AppPreferences _appPreferences;
  final UserDao _userDao;
  final LocalUserDataMapper _localUserDataMapper;
  final LocalImageUrlDataMapper _localImageUrlDataMapper;
  final PreferenceUserDataMapper _preferenceUserDataMapper;

  UserLocalDataSource(this._appPreferences, this._userDao, this._localUserDataMapper,
      this._localImageUrlDataMapper, this._preferenceUserDataMapper);

  Future<bool> saveAccessToken(String token) => _appPreferences.saveAccessToken(token);

  Future<bool> saveRefreshToken(String token) => _appPreferences.saveRefreshToken(token);

  Future<bool> saveDeviceToken(String token) => _appPreferences.saveDeviceToken(token);

  String get deviceToken => _appPreferences.deviceToken;

  Future<bool> saveIsLoggedIn(bool isLoggedIn) => _appPreferences.saveIsLoggedIn(isLoggedIn);

  bool get isLoggedIn => _appPreferences.isLoggedIn;

  Future<bool> saveUserPreference(User user) =>
      _appPreferences.saveCurrentUser(_preferenceUserDataMapper.mapToPreferenceData(user));

  User getUserPreference() => _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  int insertUser(User user) {
    final localUserData = _localUserDataMapper.mapToLocalData(user)
      ..avatar.target = (_localImageUrlDataMapper.mapToLocalData(user.avatar)
        ..type = LocalImageUrlType.userAvatar);
    return _userDao.insertUser(localUserData);
  }

  Stream<List<User>> getUsers() {
    return _userDao.getUsers().map(_localUserDataMapper.mapToListEntity);
  }

  int deleteAllUsers() => _userDao.deleteAllUsers();

  Future<void> clearAllUserInfo() => _appPreferences.clearAllUserInfo();
}
