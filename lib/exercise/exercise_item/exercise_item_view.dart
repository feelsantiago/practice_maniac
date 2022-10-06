import 'package:flutter/material.dart';
import 'package:practice_maniac/components/card_title.dart';
import 'package:practice_maniac/components/color_card.dart';
import 'package:practice_maniac/components/editable_slidable.dart';
import 'package:practice_maniac/exercise/components/last_progress_measure.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/exercise/exercise_item/exercise_item_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view_data.dart';

class ExerciseItemView extends ViewData<Exercise, ExerciseItemViewModel> {
  final Exercises exercises;

  Exercise get exercise => viewModel.model.value;

  ExerciseItemView(
      {Key? key, required Exercise exercise, required this.exercises})
      : super(key: key, model: exercise);

  @override
  dynamic onInit() {
    viewModel.exercises = exercises;
  }

  @override
  Widget build(BuildContext context) {
    return EditableSlidable(
      key: ValueKey(exercise),
      onEdit: viewModel.edit,
      onRemove: viewModel.remove,
      body: ColorCard(
        color: Color(exercise.color),
        onTap: viewModel.detail,
        children: [
          CardTitle(exercise.name),
          LastProgressMeasure(
            progresses: exercise.progress,
            measure: exercise.measure,
          ),
        ],
      ),
    );
  }
}
