extension ListExtensions<T> on List<T> {
  void sortBy(Comparable Function(T e) getVal) =>
      sort((a, b) => getVal(a).compareTo(getVal(b)));

  void sortByDescending(Comparable Function(T e) getVal) =>
      sort((a, b) => getVal(b).compareTo(getVal(a)));

  T? get firstOrNull => isEmpty ? null : first;

  T? getOrNull(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    } else {
      return null;
    }
  }

  Iterable<T> distinct() {
    final set = <T>{};
    return where(set.add);
  }

  Map<K, List<V>> groupBy<K, V>(
    K Function(T) keySelector,
    V Function(T) valueTransform,
  ) {
    final map = <K, List<V>>{};
    forEach((e) {
      final key = keySelector(e);
      final value = valueTransform(e);
      final list = map[key];

      if (list == null) {
        map[key] = [value];
      } else {
        list.add(value);
      }
    });
    return map;
  }
}

extension NullableListExtensions<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
