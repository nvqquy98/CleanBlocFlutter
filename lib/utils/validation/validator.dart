import 'package:dartx/dartx.dart';

import '../../data/source/remote/api/error/server_error_constants.dart';
import '../../generated/l10n.dart';

class Validator {
  const Validator._();

  static List<ValidationError> validateEmail(String email,
      [String? emailConfirmation]) {
    return <ValidationError>[
      if (!RegExp(_emailRegex).hasMatch(email))
        const ValidationError(
            ValidationErrorKind.invalidEmailFormat, ValidationErrorField.email),
      if (emailConfirmation != null && email != emailConfirmation)
        const ValidationError(
            ValidationErrorKind.emailsAreDifferent, ValidationErrorField.email)
    ];
  }

  static List<ValidationError> validatePassword(String password,
      [String? passwordConfirmation]) {
    return <ValidationError>[
      if (!RegExp(_passwordRegex).hasMatch(password) ||
          !RegExp(_validCharsPasswordRegex).hasMatch(password) ||
          password.length < _minLengthPassword)
        const ValidationError(ValidationErrorKind.invalidPasswordFormat,
            ValidationErrorField.password),
      if (passwordConfirmation != null && password != passwordConfirmation)
        const ValidationError(ValidationErrorKind.passwordsAreDifferent,
            ValidationErrorField.passwordConfirmation)
    ];
  }

  static List<ValidationError> validateNickName(String nickname) {
    return <ValidationError>[
      if (nickname.isEmpty)
        const ValidationError(
            ValidationErrorKind.nicknameIsEmpty, ValidationErrorField.nickname),
      if (nickname.isBlank)
        const ValidationError(ValidationErrorKind.invalidNicknameFormat,
            ValidationErrorField.nickname)
    ];
  }

  static List<ValidationError> validateRegistration(String nickname,
      String email, String password, String passwordConfirmation) {
    return <ValidationError>[
      ...validateNickName(nickname),
      ...validateEmail(email),
      ...validatePassword(password, passwordConfirmation)
    ];
  }

  static String getMessageByErrorKind(ValidationErrorKind kind) {
    switch (kind) {
      case ValidationErrorKind.invalidEmailFormat:
        return S.current.error_email_is_incorrect;
      case ValidationErrorKind.invalidNicknameFormat:
        return S.current.nickname_format_is_incorrect;
      case ValidationErrorKind.invalidPasswordFormat:
        return S.current.password_format_is_incorrect;
      case ValidationErrorKind.passwordsAreDifferent:
        return S.current.passwords_are_different;
      case ValidationErrorKind.emailsAreDifferent:
        return S.current.emails_are_different;
      case ValidationErrorKind.nicknameIsEmpty:
        return S.current.nick_name_is_required;
    }
  }

  static const _emailRegex =
      "[A-Za-z\\d\\\\!\"#\$%&'()*+,-./:;<=>?\\[\\]^_`{|}~]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,63}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,24})+";
  static const _passwordRegex =
      "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[ \\\\!\"#\$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~])[A-Za-z\\d \\\\!\"#\$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~]{10,255}\$";
  static const _validCharsPasswordRegex =
      "^[a-zA-Z0-9 \\\\!\"#\$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~]+\$";
  static const _minLengthPassword = 10;
}

class ValidationError implements Exception {
  final ValidationErrorKind kind;
  final ValidationErrorField field;

  const ValidationError(this.kind, this.field);
}

enum ValidationErrorKind {
  invalidEmailFormat,
  invalidNicknameFormat,
  invalidPasswordFormat,
  passwordsAreDifferent,
  emailsAreDifferent,
  nicknameIsEmpty,
}

class ValidationErrorField {
  final String value;

  const ValidationErrorField(this.value);

  static const nickname = ValidationErrorField(ServerErrorField.nickname);
  static const email = ValidationErrorField(ServerErrorField.email);
  static const password = ValidationErrorField(ServerErrorField.password);
  static const passwordConfirmation =
      ValidationErrorField(ServerErrorField.passwordConfirmation);
}

extension ListExtensions on List<ValidationError> {
  bool get isValid => isEmpty;

  String? get firstErrorMessage {
    final ValidationError? first = firstOrNull;
    return first != null ? Validator.getMessageByErrorKind(first.kind) : null;
  }
}
