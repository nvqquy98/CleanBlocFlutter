import 'dart:async';

import '../log/log_utils.dart';

class DisposeBagConfig {
  static bool enableLogging = true;
}

class DisposeBag {
  final List<Object> _disposable = [];

  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    _disposable.forEach((disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
        if (DisposeBagConfig.enableLogging) printKV(tag, 'canceled $disposable');
      } else if (disposable is StreamController) {
        disposable.close();
        if (DisposeBagConfig.enableLogging) printKV(tag, 'closed $disposable');
      }
    });

    _disposable.clear();
  }

  static const tag = 'DisposeBag';
}

extension DisposableStreamSubscription on StreamSubscription {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension DisposableStreamController on StreamController {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}
