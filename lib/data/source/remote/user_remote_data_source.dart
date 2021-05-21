import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/entity/token.dart';
import '../../../domain/entity/unit.dart';
import '../../../domain/entity/user.dart';
import 'api/auth_api.dart';
import 'api/none_auth_api.dart';
import 'model/mapper/remote_token_data_mapper.dart';
import 'model/mapper/remote_user_data_mapper.dart';

@LazySingleton()
class UserRemoteDataSource {
  final NoneAuthApi _noneAuthApi;
  final AuthApi _authApi;
  final RemoteUserDataMapper _remoteUserDataMapper;
  final RemoteTokenDataMapper _remoteTokenDataMapper;

  UserRemoteDataSource(this._noneAuthApi, this._authApi,
      this._remoteUserDataMapper, this._remoteTokenDataMapper);

  Future<Unit> logout() => _authApi.logout();

  Future<User> getCurrentUser() async {
    /// test queue, cancellation api
    await Future.delayed(const Duration(seconds: 5));
    final response = await _authApi.getCurrentUser();
    return _remoteUserDataMapper.mapToEntity(response.data.userData);
  }

  Future<Unit> changePassword(String currentPassword, String newPassword) =>
      _authApi.changePassword(currentPassword, newPassword);

  Future<Tuple2<Token, User>> login(String email, String password) async {
    final response = await _noneAuthApi.login(email, password);
    return Tuple2(_remoteTokenDataMapper.mapToEntity(response.data.tokenInfo),
        _remoteUserDataMapper.mapToEntity(response.data.user));
  }

  Future<Unit> forgotPassword(String email) =>
      _noneAuthApi.forgotPassword(email);

  Future<Tuple2<Token, User>> register(String nickname, String email,
      String password, String? gender, String? avatarFilePath) async {
    final response = await _noneAuthApi.register(
        nickname, email, password, gender, avatarFilePath);
    return Tuple2(_remoteTokenDataMapper.mapToEntity(response.data.tokenInfo),
        _remoteUserDataMapper.mapToEntity(response.data.user));
  }
}
