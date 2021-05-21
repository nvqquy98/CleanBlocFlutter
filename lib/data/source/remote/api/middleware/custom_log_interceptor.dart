import 'package:dio/dio.dart';

import '../../../../../utils/log/log_utils.dart';

class CustomLogInterceptor extends InterceptorsWrapper {
  final bool requestHeader;
  final bool requestBody;
  final bool successResponse;
  final bool errorResponse;

  CustomLogInterceptor(
      {this.requestHeader = true,
      this.requestBody = true,
      this.successResponse = true,
      this.errorResponse = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('************ Request ************');
    printKV('Request', '${options.method} ${options.uri}');
    if (requestHeader && options.headers.isNotEmpty) {
      print('Request Headers:');
      options.headers.forEach((key, v) => printKV(' $key', v));
    }

    if (requestBody && options.data != null) {
      print('Request Body:');
      _printAll(options.data);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('************ Response ************');
    printKV('Status Code',
        '${response.requestOptions.method} ${response.requestOptions.uri} ${response.statusCode}');

    if (successResponse) {
      print('Success Response:');
      _printAll(response.toString());
    }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('************ Error ************');
    if (err.response != null) {
      printKV('Status Code',
          '${err.requestOptions.method} ${err.requestOptions.uri} ${err.response!.statusCode}');
      if (errorResponse && err.response!.data != null) {
        print('Error Response:');
        _printAll(err.response!.toString());
      } else {
        print('DioError: ${err.error}');
      }
    }

    handler.next(err);
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(print);
  }
}
