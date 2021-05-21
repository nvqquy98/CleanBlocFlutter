import 'package:dio/dio.dart';
import 'middleware/custom_log_interceptor.dart';

import 'config/api_config.dart';

class DioGenerator {
  static const connectTimeout = 30000;
  static const receiveTimeout = 30000;
  static const sendTimeout = 30000;

  const DioGenerator._();

  static Dio generate(List<Interceptor> interceptors) {
    return Dio(
      BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        baseUrl: ApiConfig.baseUrl(),
      ),
    )..interceptors.addAll([
        ...interceptors,
        CustomLogInterceptor(),
        /// LogInterceptor should be the last element in interceptors
      ]);
  }
}
