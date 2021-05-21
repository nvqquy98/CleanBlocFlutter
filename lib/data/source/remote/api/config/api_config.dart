import 'dart:convert';

import '../../../../../build_config.dart';

class ApiConfig {
  static const _baseUrlDev = 'https://api.dev.chatwork.com/api/';
  static const _baseUrlStg = 'https://api.stg.facebook.com/api/';
  static const _baseUrlProd = 'https://chatwork.com/api/';

  static const jwtAuthorization = 'JWTAuthorization';
  static const authorization = 'Authorization';

  static const _basicAuthorizationName = 'demo_name';
  static const _basicAuthorizationPassword = 'demo_password';

  static const bearer = 'Bearer';

  static String baseUrl() {
    switch (BuildConfig.flavor) {
      case Flavor.develop:
        return _baseUrlDev;
      case Flavor.staging:
        return _baseUrlStg;
      default:
        return _baseUrlProd;
    }
  }

  static String basicAuthenticationHeader() {
    return 'Basic ${base64Encode(
      utf8.encode('$_basicAuthorizationName:$_basicAuthorizationPassword'),
    )}';
  }
}
