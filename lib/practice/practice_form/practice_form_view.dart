import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/rx_form.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_model.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_view_model.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:practice_maniac/utils/text_initial_value.dart';

class PracticeFormView
    extends ViewData<PracticeFormModel, PracticeFormViewModel> {
  PracticeFormModel get practice => viewModel.model.value;

  PracticeFormView({
    Key? key,
    Practice? practice,
  }) : super(key: key, model: PracticeFormModel.create(practice));

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'New Practice',
      body: RxForm(
        form: viewModel.form,
        child: Column(
          children: [
            TextFormField(
              initialValue: TextInitialValue(practice.name.value).value(),
              decoration: const InputDecoration(
                hintText: 'What do you want to practice?',
              ),
              validator: FormValidator(
                EmptyTextValidator(),
              ).register(),
              onSaved: (name) {
                practice.name.value = name ?? '';
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: BlockPicker(
                pickerColor: practice.color.value,
                availableColors: viewModel.colors.exclude([Colors.black]),
                onColorChanged: (color) {
                  practice.color.value = color;
                },
              ),
            ),
          ],
        ),
      ),
      floatingButton: FloatingActionButton(
        tooltip: 'Save',
        child: const Icon(Icons.done),
        onPressed: () {
          viewModel.submit();
        },
      ),
    );
  }
}
