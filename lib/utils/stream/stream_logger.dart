import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class StreamLoggerConfig {
  static bool get enableStreamLogger {
    if (_enableStreamLogger == null) {
      assert(() {
        _enableStreamLogger = true;
        return true;
      }());
    }

    return _enableStreamLogger ??= false;
  }

  static set enableStreamLogger(bool value) => _enableStreamLogger = value;

  static bool? _enableStreamLogger;
}

class StreamLogger {
  /// if we need log events of one or some specific stream instead of all streams,
  /// we can set [needLog = false] here and set [needLog = true] on the specific stream
  static const bool needLogOnDispose = true;
  static const bool needLogOnAddEvent = true;
  static const bool needLogOnListen = true;
  static const bool needLogOnData = true;
  static const bool needLogOnError = true;
  static const bool needLogOnDone = true;
  static const bool needLogOnCancel = true;
  static const bool _logTime = true;

  static final _logger =
      Logger(printer: PrettyPrinter(printTime: _logTime, methodCount: 0));

  const StreamLogger._();

  static void error(String message) {
    if (StreamLoggerConfig.enableStreamLogger) _logger.e(message);
  }

  static void debug(String message) {
    if (StreamLoggerConfig.enableStreamLogger) _logger.d(message);
  }

  static void info(String message) {
    if (StreamLoggerConfig.enableStreamLogger) _logger.i(message);
  }

  static void warn(String message) {
    if (StreamLoggerConfig.enableStreamLogger) _logger.w(message);
  }

  static void logOnAddEvent(
      String? controllerName, Object? event, bool needLog) {
    if (controllerName != null && needLog)
      info('$controllerName add event $event');
  }

  static void logOnDispose(String? disposableName, bool needLog) {
    if (disposableName != null && needLog) warn('Disposed $disposableName');
  }

  static Stream<T> logOnNotification<T>(Stream<T> stream, String name,
      {required bool onListen,
      required bool onData,
      required bool onError,
      required bool onDone,
      required bool onCancel}) {
    return stream.doOnListen(() {
      if (onListen) debug('$name is subscribed');
    }).doOnData((event) {
      if (onData) info('$name onData: $event');
    }).doOnCancel(() {
      if (onCancel) warn('$name is canceled');
    }).doOnError((e, _) {
      if (onError) error(e.toString());
    }).doOnDone(() {
      if (onDone) info('$name is done');
    });
  }
}
