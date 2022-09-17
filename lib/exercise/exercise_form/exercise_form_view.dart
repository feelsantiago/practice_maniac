import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/rx_form.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_form/exercise_form_model.dart';
import 'package:practice_maniac/exercise/exercise_form/exercise_form_view_model.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:practice_maniac/utils/text_initial_value.dart';

class ExerciseFormView
    extends ViewData<ExerciseFormModel, ExerciseFormViewModel> {
  ExerciseFormModel get exercise => viewModel.model.value;

  ExerciseFormView({
    Key? key,
    Exercise? exercise,
  }) : super(key: key, model: ExerciseFormModel.create(exercise));

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'New Exercise',
      body: RxForm(
        form: viewModel.form,
        child: Column(
          children: [
            TextFormField(
              initialValue: TextInitialValue(exercise.name.value).value(),
              decoration: const InputDecoration(
                hintText: 'What do you want to track?',
              ),
              validator: FormValidator(
                EmptyTextValidator(),
              ).register(),
              onSaved: (name) {
                exercise.name.value = name ?? '';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              initialValue: TextInitialValue(exercise.measure.value).value(),
              decoration: const InputDecoration(
                hintText: 'How it\'s measured?',
              ),
              validator: FormValidator(
                EmptyTextValidator(),
              ).register(),
              onSaved: (measure) {
                exercise.measure.value = measure ?? '';
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: BlockPicker(
                pickerColor: exercise.color.value,
                availableColors: viewModel.colors.exclude([Colors.black]),
                onColorChanged: (color) {
                  exercise.color.value = color;
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
