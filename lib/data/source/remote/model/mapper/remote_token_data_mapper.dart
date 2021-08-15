import 'package:injectable/injectable.dart';

import '../../../../../domain/entity/token.dart';
import '../remote_token_data.dart';
import 'base/base_remote_data_mapper.dart';

@Injectable()
class RemoteTokenDataMapper extends BaseRemoteDataMapper<RemoteTokenData, Token> {
  @override
  Token mapToEntity(RemoteTokenData? data) {
    return Token(accessToken: data?.accessToken ?? '', refreshToken: data?.refreshToken ?? '');
  }
}
