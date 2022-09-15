import 'dart:async';
import 'dart:developer';

import 'package:practice_maniac/infra/mvvm/error_logger.dart';
import 'package:practice_maniac/utils/listeners_sink.dart';
import 'package:rx_command/rx_command.dart';

abstract class ViewModel {
  final ListenersSink listeners = ListenersSink();

  /// This function is called once after widget been initialized
  ///
  /// You can return a [value], a [Future] or a [Stream]
  ///
  /// When a async operation is returned the app will show a [CircularProgressBar]
  FutureOr onInit() {}
  FutureOr onUpdate() {}

  /// Dispose default listeners
  ///
  /// Always call super.onDispose() if you override this method
  FutureOr onDispose() {
    listeners.cancel();
  }

  /// Register commands listeners to ensure command dispose
  ///
  /// Listen to commands errors
  void commands(List<RxCommand> commands) {
    commands.forEach((command) {
      final listener = RxCommandListener(command,
          onError: (error) => ErrorLogger(error).print());
      listeners.command = command;
      listeners.commandListener = listener;
    });
  }
}
