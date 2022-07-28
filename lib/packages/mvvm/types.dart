import 'dart:async';
import 'package:rxdart/rxdart.dart';

typedef FutureOrAction<T> = FutureOr<T> Function();

class FutureOrToStream<T> {
  final FutureOrAction<T> action;

  FutureOrToStream(this.action);

  static Stream<T> from<T>(FutureOrAction<T> action) {
    return FutureOrToStream(action).resolve();
  }

  Stream<T> resolve() {
    final value = action();

    if (value is Future) {
      return Stream.fromFuture(value as Future<T>);
    }

    if (value is Stream) {
      return value as Stream<T>;
    }

    return Stream.value(value);
  }
}

class LoadingStream {
  late final Stream<bool> stream;

  LoadingStream(this.stream) {
    // ignore: unnecessary_this
    this.stream = stream.mapTo(false);
  }

  LoadingStream.many(List<Stream<dynamic>> streams) {
    stream = CombineLatestStream(streams, (_) => false);
  }

  Stream<bool> combine() {
    return ConcatStream([
      Stream.value(true),
      stream,
    ]).asBroadcastStream();
  }
}

abstract class ModelBiding<T, K> {
  late K _model;

  // ignore: unnecessary_getters_setters
  K get model => _model;
  set model(K data) {
    _model = data;
  }

  void bind(T data);
  void bindReference(K reference);
}
