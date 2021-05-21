import 'dart:convert';

import 'package:basecleanflutter/domain/entity/unit.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/shared_pref_key.dart';
import 'error/shared_pref_exception.dart';
import 'model/preference_user_data.dart';

@LazySingleton()
class AppPreferences {
  final SharedPreferences _sharedPreference;

  AppPreferences(this._sharedPreference);

  Future<bool> saveAccessToken(String token) async {
    return _sharedPreference
        .setString(SharedPrefKey.accessToken, token)
        .catchError((error) =>
            throw SharedPrefException('Can not save access token', error));
  }

  String get accessToken {
    return _sharedPreference.getString(SharedPrefKey.accessToken) ?? '';
  }

  Future<bool> saveRefreshToken(String token) async {
    return _sharedPreference
        .setString(SharedPrefKey.refreshToken, token)
        .catchError((error) =>
            throw SharedPrefException('Can not save refresh token', error));
  }

  String get refreshToken {
    return _sharedPreference.getString(SharedPrefKey.refreshToken) ?? '';
  }

  Future<bool> saveIsLoggedIn(bool isLoggedIn) async {
    return _sharedPreference
        .setBool(SharedPrefKey.isLoggedIn, isLoggedIn)
        .catchError((error) =>
            throw SharedPrefException('Can not save isLoggedIn flag', error));
  }

  Future<bool> saveCurrentUser(PreferenceUserData preferenceUserData) async {
    return _sharedPreference
        .setString(SharedPrefKey.currentUser, json.encode(preferenceUserData))
        .catchError((error) =>
            throw SharedPrefException('Can not save current user', error));
  }

  PreferenceUserData? get currentUser {
    final String? user = _sharedPreference.getString(SharedPrefKey.currentUser);
    if (user == null) return null;
    return PreferenceUserData.fromJson(json.decode(user));
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(SharedPrefKey.isLoggedIn) ?? false;
  }

  Future<Unit> clearUserInfo() async {
    await Future.wait([
      _sharedPreference.remove(SharedPrefKey.currentUser),
      _sharedPreference.remove(SharedPrefKey.isLoggedIn),
      _sharedPreference.remove(SharedPrefKey.accessToken),
      _sharedPreference.remove(SharedPrefKey.refreshToken),
    ]);
    return Unit();
  }
}
