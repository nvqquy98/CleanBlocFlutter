import 'package:dio/dio.dart';
import '../response/error_response.dart';

import 'http_request_exception.dart';

class HttpRequestExceptionMapper {
  HttpRequestException map(Object? exception) {
    if (exception is DioError) {
      if (exception.error is HttpRequestException) {
        return exception.error;
      }
      switch (exception.type) {
        case DioErrorType.cancel:
          return const HttpRequestException.cancellationError();
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return const HttpRequestException.timeoutError();
        case DioErrorType.other:
          break;
        case DioErrorType.response:
          if (exception.response?.data != null) {
            return HttpRequestException.serverError(
                exception.response!.statusCode,
                ErrorResponse.fromJson(exception.response!.data!));
          } else {
            return HttpRequestException.httpError(
                exception.response!.statusCode);
          }
      }
    }

    // other Dio error,...
    return HttpRequestException.unexpectedError(exception is Exception
        ? exception
        : Exception(exception?.toString() ?? 'exception is null'));
  }
}
