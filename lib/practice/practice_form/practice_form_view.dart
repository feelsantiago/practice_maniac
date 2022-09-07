import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/rx_form.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_view_model.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/form.dart';

class PracticeFormView extends ViewData<Practice, PracticeFormViewModel> {
  final bool edit;

  Practice get practice => viewModel.model.value;

  PracticeFormView({
    Key? key,
    Practice? practice,
  })  : edit = Defined(practice).exist(),
        super(key: key, model: practice ?? Practice.empty());

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'New Practice',
      body: RxForm(
        form: viewModel.form,
        child: Column(
          children: [
            TextFormField(
              initialValue: edit ? practice.name : null,
              decoration: const InputDecoration(
                hintText: 'What do you want to practice?',
              ),
              validator: FormValidator(
                EmptyTextValidator(),
              ).register(),
              onSaved: (name) {
                practice.name = name ?? '';
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: BlockPicker(
                pickerColor: Color(practice.color),
                availableColors: viewModel.colors.exclude([Colors.black]),
                onColorChanged: (color) {
                  practice.color = color.value;
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
