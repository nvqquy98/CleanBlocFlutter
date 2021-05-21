import '../../../../../utils/utils.dart';
import '../response/error_response.dart';

class HttpRequestException implements Exception {
  final HttpRequestExceptionKind kind;
  final int? statusCode;
  final ErrorResponse? errorResponse;
  final Exception? exception;

  const HttpRequestException(this.kind,
      {this.statusCode, this.errorResponse, this.exception});

  const HttpRequestException.httpError(int? statusCode)
      : this(HttpRequestExceptionKind.http, statusCode: statusCode);

  const HttpRequestException.serverError(
      int? statusCode, ErrorResponse errorResponse)
      : this(HttpRequestExceptionKind.server,
            statusCode: statusCode, errorResponse: errorResponse);

  const HttpRequestException.networkError(int statusCode)
      : this(HttpRequestExceptionKind.network, statusCode: statusCode);

  const HttpRequestException.noInternetError()
      : this(HttpRequestExceptionKind.noInternet);

  const HttpRequestException.timeoutError()
      : this(HttpRequestExceptionKind.timeout);

  const HttpRequestException.cancellationError()
      : this(HttpRequestExceptionKind.cancellation);

  const HttpRequestException.unexpectedError(Exception exception)
      : this(HttpRequestExceptionKind.unexpected, exception: exception);

  List<Error>? getServerErrors() => errorResponse?.errors;

  int? getFirstServerErrorCode() => getServerErrors()?.firstOrNull?.code;

  String? getFirstServerErrorMessage() =>
      getServerErrors()?.firstOrNull?.message;

  bool get isServerDownError =>
      statusCode != null && statusCode! >= 500 && statusCode! <= 599;

  @override
  String toString() {
    return 'HttpRequestException: {kind: $kind, statusCode: $statusCode, errorResponse: $errorResponse, exception: $exception}';
  }
}

enum HttpRequestExceptionKind {
  noInternet,
  network,
  http,
  server,
  timeout,
  cancellation,
  unexpected
}
