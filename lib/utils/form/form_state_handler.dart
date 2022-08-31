import 'package:flutter/material.dart';

abstract class FormStateHandler {
  bool validate();
  void reset();
  void save();
  GlobalKey<FormState> key();
}

class FormBuilder implements FormStateHandler {
  final GlobalKey<FormState> _state = GlobalKey();

  BuildContext get context => _state.currentContext!;
  FormState get state => _state.currentState!;

  @override
  GlobalKey<FormState> key() {
    return _state;
  }

  @override
  bool validate() {
    return state.validate();
  }

  @override
  void reset() {
    state.reset();
  }

  @override
  void save() {
    state.save();
  }
}
