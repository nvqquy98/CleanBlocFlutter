class HttpRequestLogConfig {
  static bool get enableLogInterceptor {
    if (_enableLogInterceptor == null) {
      assert(() {
        _enableLogInterceptor = true;
        return true;
      }());
    }

    return _enableLogInterceptor ??= false;
  }

  static set enableLogInterceptor(bool value) => _enableLogInterceptor = value;

  static bool? _enableLogInterceptor;
}