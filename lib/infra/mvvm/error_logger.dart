import 'dart:developer';

import 'package:rx_command/rx_command.dart';

class ErrorLogger {
  final dynamic error;

  ErrorLogger(CommandError command) : error = command.error;

  void print() {
    log('[Command Error]', error: error);

    if (error is Error) {
      log('[Command Stack]', stackTrace: error.stackTrace);
    }
  }
}
