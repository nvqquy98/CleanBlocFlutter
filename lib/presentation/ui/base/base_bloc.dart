import '../../../utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final DisposeBag disposeBag = DisposeBag();

  final _errorSubject = PublishSubject<Object>();

  Sink<Object> get _errorSink => _errorSubject.sink;

  Stream<Object> get errorStream => _errorSubject.stream;

  final _loadingSubject = PublishSubject<bool>();

  Sink<bool> get _loadingSink => _loadingSubject.sink;

  Stream<bool> get loadingStream => _loadingSubject.stream;

  Stream<T> executeFuture<T>(Future<T> future,
      {bool showLoading = true, bool showError = true}) {
    return executeStream(future.asStream(),
        showLoading: showLoading, showError: showError);
  }

  Stream<T> executeStream<T>(Stream<T> stream,
      {bool showLoading = true, bool showError = true}) {
    return stream.doOnListen(() {
      if (showLoading) emitLoading(true);
    }).doOnError((error, _) {
      if (showError) emitError(error);
    }).doOnDone(() {
      if (showLoading) emitLoading(false);
    });
  }

  void emitError(Object error) {
    _errorSink.add(error);
  }

  void emitLoading(bool isLoading) {
    _loadingSink.add(isLoading);
  }

  void dispose() {
    _errorSubject.close();
    _loadingSubject.close();
    disposeBag.dispose();
  }
}

@Injectable()
class EmptyBloc extends BaseBloc {}
