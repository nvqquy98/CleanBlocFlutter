import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/exception/mapper/exception_mapper.dart';
import '../../../../../domain/exception/remote_exception.dart';
import '../../model/api_response/error_response.dart';
import '../../model/mapper/error_response_mapper.dart';


@Injectable()
class HttpRequestExceptionMapper extends ExceptionMapper<RemoteException> {
  final ErrorResponseMapper _errorResponseMapper;

  HttpRequestExceptionMapper(this._errorResponseMapper);

  @override
  RemoteException map(Object? exception) {
    if (exception is DioError) {
      if (exception.error is RemoteException) {
        return exception.error;
      }
      switch (exception.type) {
        case DioErrorType.cancel:
          return const RemoteException.cancellationError();
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return const RemoteException.timeoutError();
        case DioErrorType.other:
          break;
        case DioErrorType.response:
          if (exception.response?.data != null) {
            return RemoteException.serverError(
              exception.response!.statusCode,
              _errorResponseMapper.mapToEntity(
                ErrorResponse.fromJson(exception.response!.data!),
              ),
            );
          } else {
            return RemoteException.httpError(exception.response!.statusCode);
          }
      }
    }

    // other Dio error,...
    return RemoteException.unexpectedError(exception is Exception
        ? exception
        : Exception(exception?.toString() ?? 'exception is null'));
  }
}
