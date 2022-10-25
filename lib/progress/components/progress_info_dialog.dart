import 'package:flutter/material.dart';
import 'package:practice_maniac/components/rx_form.dart';
import 'package:practice_maniac/utils/form/form_state_handler.dart';

class ProgressInfoDialog extends StatelessWidget {
  final String title;
  final String measure;

  const ProgressInfoDialog(
      {Key? key, required this.title, required this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: RxForm(
        form: FormBuilder(),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: measure),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Salvar'),
        )
      ],
    );
  }
}
