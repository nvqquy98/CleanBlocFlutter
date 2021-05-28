import 'dart:async';

import '../log/log_utils.dart';

extension StreamControllerExt on StreamController {
  void addSafely(dynamic event) {
    if (!isClosed) {
      add(event);
    } else {
      printKV('StreamController',
          'Can not add event when StreamController is closed');
    }
  }
}
