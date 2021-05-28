import 'dart:async';

/// close all stream controllers and cancel all stream subscription
class DisposeBag {
  final List<Object> _disposable = [];

  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    _disposable.forEach((disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
      } else if (disposable is StreamController) {
        disposable.close();
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
