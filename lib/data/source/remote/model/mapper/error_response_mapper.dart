import '../api_response/error_response.dart';

import 'base/base_remote_data_mapper.dart';
import 'error_response_detail_mapper.dart';
import '../../../../../domain/entity/server_error.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ErrorResponseMapper extends BaseRemoteDataMapper<ErrorResponse, ServerError> {
  final ErrorResponseDetailMapper _errorResponseDetailMapper;

  ErrorResponseMapper(this._errorResponseDetailMapper);

  @override
  ServerError mapToEntity(ErrorResponse? data) {
    return ServerError(
      errors: _errorResponseDetailMapper.mapToListEntity(data?.errors),
    );
  }
}
