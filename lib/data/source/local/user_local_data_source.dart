import '../../../domain/entity/unit.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/user.dart';
import 'database/database_api.dart';
import 'database/model/local_image_url_data.dart';
import 'database/model/mapper/local_image_url_data_mapper.dart';
import 'database/model/mapper/local_user_data_mapper.dart';
import 'preference/app_preferences.dart';
import 'preference/model/mapper/preference_user_data_mapper.dart';

@LazySingleton()
class UserLocalDataSource {
  final AppPreferences _appPreferences;
  final DatabaseApi _databaseApi;

  final LocalUserDataMapper _localUserDataMapper;
  final LocalImageUrlDataMapper _localImageUrlDataMapper;
  final PreferenceUserDataMapper _preferenceUserDataMapper;

  UserLocalDataSource(
      this._appPreferences,
      this._databaseApi,
      this._localUserDataMapper,
      this._localImageUrlDataMapper,
      this._preferenceUserDataMapper);

  Future<bool> saveAccessToken(String token) =>
      _appPreferences.saveAccessToken(token);

  Future<bool> saveRefreshToken(String token) =>
      _appPreferences.saveRefreshToken(token);

  Future<bool> saveIsLoggedIn(bool isLoggedIn) =>
      _appPreferences.saveIsLoggedIn(isLoggedIn);

  bool get isLoggedIn => _appPreferences.isLoggedIn;

  Future<bool> saveUserPreference(User user) => _appPreferences
      .saveCurrentUser(_preferenceUserDataMapper.mapToPreferenceData(user));

  User getUserPreference() =>
      _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  int insertUser(User user) {
    final localUserData = _localUserDataMapper.mapToLocalData(user)
      ..avatar.target = (_localImageUrlDataMapper.mapToLocalData(user.avatar)
        ..type = LocalImageUrlType.userAvatar);
    return _databaseApi.insertUser(localUserData);
  }

  Stream<List<User>> getUsers() {
    return _databaseApi.getUsers().map(_localUserDataMapper.mapToListEntity);
  }

  int deleteAllUsers() => _databaseApi.deleteAllUsers();

  Future<Unit> clearAllUserInfo() => _appPreferences.clearUserInfo();

  Future<bool> saveIsDarkMode(bool isDarkMode) =>
      _appPreferences.saveIsDarkMode(isDarkMode);

  bool get isDarkMode => _appPreferences.isDarkMode;
}
