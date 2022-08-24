import 'dart:async';

class ListenersSink {
  final List<StreamSubscription> _sink = [];

  set sink(StreamSubscription listener) {
    _sink.add(listener);
  }

  Future<void> cancel() async {
    await Future.wait(_sink.map((listener) => listener.cancel()));
    _sink.clear();
  }
}
