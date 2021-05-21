import 'package:dio/dio.dart';
import '../../../../domain/entity/unit.dart';
import 'package:injectable/injectable.dart';

import 'dio_generator.dart';
import 'middleware/basic_auth_interceptor.dart';
import 'middleware/connectivity_interceptor.dart';
import 'response/base_response.dart';
import 'response/login_response.dart';
import 'response/refresh_token_response.dart';
import 'service_api_mixin.dart';

@LazySingleton()
class NoneAuthApi with ServiceApiMixin {
  final Dio _dio = DioGenerator.generate([
    ConnectivityInterceptor(),
    BasicAuthInterceptor(),
  ]);

  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    return _dio.fetch(requestOptions);
  }

  Future<BaseResponse<LoginResponse>> login(
      String email, String password) async {
    final response = await request(() => _dio.post('v1/login', data: {
          'user': {'email': email, 'password': password}
        }));

    return BaseResponse.parseResponse(
        response, (json) => LoginResponse.fromJson(json));
  }

  Future<Unit> forgotPassword(String email) async {
    await request(() => _dio.post('v1/forgot_passwords', data: {
          'user': {'email': email}
        }));
    return Unit();
  }

  Future<BaseResponse<LoginResponse>> register(
      String nickname,
      String email,
      String password,
      String? gender,
      String? avatarFilePath) async {
    final response = await request(() async {
      return _dio.post('v1/users',
          options: Options(contentType: 'multipart/form-data'),
          data: FormData.fromMap({
            'user[nickname]': nickname,
            'user[email]': email,
            'user[password]': password,
            'user[gender]': gender,
            if (avatarFilePath != null)
              'user[avatar]': await MultipartFile.fromFile(avatarFilePath,
                  filename: 'avatar'),
          }));
    });

    return BaseResponse.parseResponse(
        response, (json) => LoginResponse.fromJson(json));
  }

  Future<BaseResponse<RefreshTokenResponse>> refreshToken(
      String refreshToken) async {
    final response = await request(() => _dio.post('v1/refresh_tokens',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {'refresh_token': refreshToken, 'grant_type': 'refresh_token'}));
    return BaseResponse.parseResponse(
        response, (json) => RefreshTokenResponse.fromJson(json));
  }
}
