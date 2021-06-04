import 'dart:async';

import 'stream_logger.dart';

extension StreamControllerExt on StreamController {
  void addSafely(Object? event,
      [String? name, bool needLog = StreamLogger.needLogOnAddEvent]) {
    StreamLogger.logOnAddEvent(name, event, needLog);
    if (!isClosed) {
      add(event);
    } else {
      StreamLogger.error('Can not add event when StreamController is closed');
    }
  }
}

extension StreamExt<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool onListen = StreamLogger.needLogOnListen,
    bool onData = StreamLogger.needLogOnData,
    bool onError = StreamLogger.needLogOnError,
    bool onDone = StreamLogger.needLogOnDone,
    bool onCancel = StreamLogger.needLogOnCancel,
  }) {
    return StreamLogger.logOnNotification(
      this,
      name,
      onListen: onListen,
      onData: onData,
      onError: onError,
      onDone: onDone,
      onCancel: onCancel,
    );
  }
}
