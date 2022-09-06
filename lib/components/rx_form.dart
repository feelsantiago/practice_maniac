import 'package:flutter/material.dart';
import 'package:practice_maniac/utils/form/form_state_handler.dart';

class RxForm extends StatelessWidget {
  final bool autoSave;
  final FormStateHandler form;
  final AutovalidateMode validate;
  final Widget child;

  const RxForm({
    Key? key,
    required this.form,
    required this.child,
    this.autoSave = false,
    this.validate = AutovalidateMode.always,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key(),
      autovalidateMode: validate,
      onChanged: () {
        if (autoSave) {
          form.validate();
          form.save();
        }
      },
      child: child,
    );
  }
}
