import 'package:dio/dio.dart';
import '../../../../domain/entity/unit.dart';
import 'package:injectable/injectable.dart';
import 'dio_generator.dart';
import 'middleware/auth_interceptor.dart';
import 'middleware/basic_auth_interceptor.dart';
import 'middleware/connectivity_interceptor.dart';

import 'service_api_mixin.dart';
import 'response/base_response.dart';
import 'response/user_response.dart';

@LazySingleton()
class AuthApi with ServiceApiMixin {
  final Dio _dio = DioGenerator.generate([
    ConnectivityInterceptor(),
    /// ConnectivityInterceptor should be the first element
    BasicAuthInterceptor(),
    AuthInterceptor(),
  ]);

  Future<Unit> logout() async {
    await request(() => _dio.delete('v1/logout'));
    return Unit();
  }

  Future<BaseResponse<UserResponse>> getCurrentUser() async {
    final response = await request(() => _dio.get('v1/users'));
    return BaseResponse.parseResponse(
        response, (json) => UserResponse.fromJson(json));
  }

  Future<Unit> changePassword(
      String currentPassword, String newPassword) async {
    await request(() => _dio.put('v1/profile/passwords', data: {
          'user': {'current_password': currentPassword, 'password': newPassword}
        }));
    return Unit();
  }
}
