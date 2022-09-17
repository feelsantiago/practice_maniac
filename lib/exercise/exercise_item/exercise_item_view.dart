import 'package:flutter/material.dart';
import 'package:practice_maniac/components/card_title.dart';
import 'package:practice_maniac/components/editable_slideble_item.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_item/exercise_item_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view_data.dart';

import 'components/last_progress.dart';

class ExerciseItemView extends ViewData<Exercise, ExerciseItemViewModel> {
  Exercise get exercise => viewModel.model.value;

  ExerciseItemView({Key? key, required Exercise exercise})
      : super(key: key, model: exercise);

  @override
  Widget build(BuildContext context) {
    return EditableSlidableItem(
      key: ValueKey(exercise),
      onTap: () {
        print('tap');
      },
      onEdit: () {
        print('edit');
      },
      onRemove: () {
        print('remove');
      },
      children: [
        CardTitle(exercise.name),
        LastProgress(
          progresses: exercise.progress,
          measure: exercise.measure,
        ),
      ],
    );
  }
}
