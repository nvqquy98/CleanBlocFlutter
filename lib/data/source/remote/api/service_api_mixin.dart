import 'package:dio/dio.dart';

import 'error/http_request_exception_mapper.dart';

mixin ServiceApiMixin {
  Future<dynamic> request(
      Future<Response<dynamic>> Function() execution) async {
    final response = await execution().catchError(
        (error) {
          throw HttpRequestExceptionMapper().map(error);
        });
    return response.data;
  }
}
