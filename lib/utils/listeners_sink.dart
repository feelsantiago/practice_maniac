import 'dart:async';

import 'package:rx_command/rx_command.dart';

class ListenersSink {
  final List<StreamSubscription> _sink = [];
  final List<RxCommand> _commands = [];
  final List<RxCommandListener> _commandListener = [];

  set sink(StreamSubscription listener) {
    _sink.add(listener);
  }

  set command(RxCommand command) {
    _commands.add(command);
  }

  set commandListener(RxCommandListener listener) {
    _commandListener.add(listener);
  }

  Future<void> cancel() async {
    _commands.forEach((command) => command.dispose());
    _commandListener.forEach((listener) => listener.dispose());
    await Future.wait(_sink.map((listener) => listener.cancel()));

    _sink.clear();
    _commands.clear();
  }
}
