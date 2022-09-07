import 'dart:async';

typedef Selector = bool Function();

class IfStreamBuilder<T> {
  final Selector selector;
  final Stream<T> onTrue;
  final Stream<T> onFalse;

  IfStreamBuilder(this.selector, this.onTrue, this.onFalse);

  Stream<T> build() {
    if (selector()) {
      return onTrue;
    }

    return onFalse;
  }
}

class IfStream<T> extends StreamView<T> {
  IfStream(bool Function() selector, Stream<T> onTrue, Stream<T> onFalse)
      : super(IfStreamBuilder<T>(selector, onTrue, onFalse).build());
}
