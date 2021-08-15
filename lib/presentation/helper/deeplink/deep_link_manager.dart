import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';

import '../../../shared/extensions.dart';
import 'deep_link_result.dart';

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
