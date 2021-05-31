import 'dart:async';

import 'stream_logger.dart';

/// close all stream controllers and cancel all stream subscription
class DisposeBag {
  final List<Disposable> _disposable = [];

  void addDisposable(Object disposable, {String? name, required bool needLog}) {
    _disposable.add(Disposable(disposable, name: name, needLog: needLog));
  }

  void dispose() {
    _disposable.forEach((disposable) {
      disposable.dispose();
    });

    _disposable.clear();
  }
}

extension DisposableStreamSubscription on StreamSubscription {
  void disposeBy(DisposeBag disposeBag,
      [String? name, bool needLog = StreamLogger.needLogOnDispose]) {
    disposeBag.addDisposable(this, name: name, needLog: needLog);
  }
}

extension DisposableStreamController on StreamController {
  void disposeBy(DisposeBag disposeBag,
      [String? name, bool needLog = StreamLogger.needLogOnDispose]) {
    disposeBag.addDisposable(this, name: name, needLog: needLog);
  }
}

class Disposable {
  final Object disposable;
  final String? name;
  final bool needLog;

  const Disposable(this.disposable, {this.name, required this.needLog});

  void dispose() {
    if (disposable is StreamSubscription) {
      (disposable as StreamSubscription)
          .cancel()
          .then((value) => StreamLogger.logOnDispose(name, needLog));
    } else if (disposable is StreamController) {
      (disposable as StreamController)
          .close()
          .then((value) => StreamLogger.logOnDispose(name, needLog));
    } else {
      StreamLogger.error(
          '$disposable${name != null ? '($name)' : ''} is neither a StreamSubscription nor a StreamController');
    }
  }
}
