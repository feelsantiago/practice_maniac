import 'dart:async';

import 'package:flutter/material.dart';

abstract class FormStateHandler {
  bool validate();
  void reset();
  void save();
  void submit();
  Stream<bool> status();
  Stream<void> saved();
  GlobalKey<FormState> key();
}

class FormBuilder implements FormStateHandler {
  final GlobalKey<FormState> _state = GlobalKey();

  final StreamController<bool> _status = StreamController.broadcast();
  final StreamController<void> _saved = StreamController.broadcast();

  BuildContext get context => _state.currentContext!;
  FormState get state => _state.currentState!;

  @override
  GlobalKey<FormState> key() {
    return _state;
  }

  @override
  void submit() {
    if (validate()) {
      save();
    }
  }

  @override
  bool validate() {
    final valid = state.validate();
    _status.sink.add(valid);

    return valid;
  }

  @override
  void reset() {
    state.reset();
  }

  @override
  void save() {
    state.save();
    _saved.sink.add(null);
  }

  @override
  Stream<bool> status() {
    return _status.stream;
  }

  @override
  Stream<void> saved() {
    return _saved.stream;
  }
}
