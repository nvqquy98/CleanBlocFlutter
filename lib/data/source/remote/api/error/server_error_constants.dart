class ServerErrorCode {
  const ServerErrorCode._();

  static const invalidRefreshToken = 1300;
  static const invalidResetPasswordToken = 1302;
  static const multipleDeviceLogin = 1602;
  static const accountHasDeleted = 1603;
  static const pageNotFound = 1051;
}

class ServerErrorField {
  const ServerErrorField._();

  static const nickname = 'nickname';
  static const email = 'email';
  static const password = 'password';
  static const passwordConfirmation = 'password_confirmation';
}
