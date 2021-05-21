import 'package:dio/dio.dart';
import '../../../../../build_config.dart';
import '../config/api_config.dart';

class BasicAuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    if (BuildConfig.flavor == Flavor.develop) {
      options.headers[ApiConfig.authorization] =
          ApiConfig.basicAuthenticationHeader();
    }
    return super.onRequest(options, handler);
  }
}
