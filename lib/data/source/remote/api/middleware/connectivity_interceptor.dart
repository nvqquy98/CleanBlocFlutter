import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import '../error/http_request_exception.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(DioError(
          requestOptions: options,
          error: const HttpRequestException.noInternetError()));
    }
    return super.onRequest(options, handler);
  }
}
