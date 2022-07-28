class MapEntry<K, V> {
  final K key;
  final V value;

  MapEntry({required this.key, required this.value});
}

class ListToMap<K, V, T> {
  final List<T> list;
  final MapEntry<K, V> Function(T) builder;

  ListToMap(this.list, this.builder);

  Map<K, V> transform() {
    final entries = list.map((element) => builder(element));

    return {
      for (var entry in entries) entry.key: entry.value,
    };
  }
}
