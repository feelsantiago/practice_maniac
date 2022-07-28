class Different<T> {
  final T value;

  Different(this.value);

  bool from(T other) {
    return value != other;
  }
}
