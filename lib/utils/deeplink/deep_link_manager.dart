import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';

import '../../utils/utils.dart';

@LazySingleton()
class DeepLinkManager {
  /// [getInitialUri] call only once when app launch
  Future<DeepLinkResult?> getInitialDeepLink() =>
      getInitialUri().then((uri) => Future.value(_mapToResult(uri)));

  /// [uriLinkStream] listen when app is being on foreground
  Stream<DeepLinkResult> foregroundDeepLinkStream() =>
      uriLinkStream.map(_mapToResult).flatMap((value) {
        if (value == null)
          return const Stream.empty();
        else
          return Stream.value(value);
      });

  DeepLinkResult? _mapToResult(Uri? uri) {
    if (uri == null) return null;
    if (!uri.pathSegments.isNullOrEmpty) {
      if (uri.pathSegments.contains(resetPassword)) {
        return ResetPasswordDeepLink(uri.queryParameters[token] ?? '');
      }
    }

    return UnknownDeepLink();
  }

  static const token = 'token';
  static const resetPassword = 'reset-password';
}

@sealed
abstract class DeepLinkResult {}

class UnknownDeepLink extends DeepLinkResult {
  UnknownDeepLink();
}

class ResetPasswordDeepLink extends DeepLinkResult {
  final String resetPasswordToken;

  ResetPasswordDeepLink(this.resetPasswordToken);
}
