abstract class Existence {
  bool exist();
}

class Undefined<T> implements Existence {
  final T value;

  Undefined(this.value);

  @override
  bool exist() {
    return value == null;
  }
}

class Defined<T> implements Existence {
  final T? value;

  Existence get not => Undefined(value);

  Defined(this.value);

  @override
  bool exist() {
    return value != null;
  }

  T get() {
    if (not.exist()) {
      throw Exception('Value not defined');
    }

    return value!;
  }
}
