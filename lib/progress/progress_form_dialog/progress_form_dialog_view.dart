import 'package:flutter/material.dart';
import 'package:practice_maniac/components/rx_form.dart';
import 'package:practice_maniac/infra/mvvm/view_data.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progress_form_model.dart';
import 'package:practice_maniac/progress/progress_form_dialog/progress_form_dialog_view_model.dart';
import 'package:practice_maniac/utils/form/form_state_handler.dart';
import 'package:practice_maniac/utils/form/form_validator.dart';
import 'package:practice_maniac/utils/form/validators.dart';

class ProgressFormDialogView
    extends ViewData<ProgressFormModel, ProgressFormDialogViewModel> {
  final String title;
  final String measure;

  ProgressFormModel get progress => viewModel.model.value;

  ProgressFormDialogView({
    Key? key,
    required this.title,
    required this.measure,
    Progress? progress,
  }) : super(key: key, model: ProgressFormModel.create(progress));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: RxForm(
        form: viewModel.form,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: measure),
          validator: FormValidator.concat([
            EmptyTextValidator(),
            OnlyNumbersValidator(),
            GreaterThanValidator(base: 0),
          ]).register(),
          onSaved: (value) {
            progress.value.value = int.tryParse(value!)!;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: viewModel.submit,
          child: const Text('Salvar'),
        )
      ],
    );
  }
}
