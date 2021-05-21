import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';

import '../../utils/utils.dart';

@LazySingleton()
class DeepLinkManager {
  /// [getInitialUri] call only once when app launch
  Stream<DeepLinkResult> initialDeepLinkStream() =>
      getInitialUri().asStream().flatMap(_mapToResult);

  /// [uriLinkStream] listen when app is being on foreground
  Stream<DeepLinkResult> foregroundDeepLinkStream() =>
      uriLinkStream.flatMap(_mapToResult);

  Stream<DeepLinkResult> _mapToResult(Uri? uri) {
    if (uri == null) return const Stream.empty();
    if (!uri.pathSegments.isNullOrEmpty) {
      if (uri.pathSegments.contains(resetPassword)) {
        return Stream.value(
            ResetPasswordDeepLink(uri.queryParameters[token] ?? ''));
      }
    }

    return Stream.value(UnknownDeepLink());
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
