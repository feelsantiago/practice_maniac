class Defined<T> {
  final T? value;

  Defined(this.value);

  bool exist() {
    return value != null;
  }

  bool empty() {
    return value == null;
  }

  T get() {
    if (empty()) {
      throw Exception('Value not defined');
    }

    return value!;
  }
}
