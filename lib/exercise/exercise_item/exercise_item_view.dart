import 'package:flutter/material.dart';
import 'package:practice_maniac/exercise/exercise.dart';
import 'package:practice_maniac/exercise/exercise_item/exercise_item_view_model.dart';
import 'package:practice_maniac/packages/mvvm/view_data.dart';

import 'components/last_progress.dart';

class ExerciseItemView extends ViewData<Exercise, ExerciseItemViewModel> {
  Exercise get exercise => viewModel.model.value;

  ExerciseItemView({Key? key, required Exercise tracker}) : super(key: key, model: tracker);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(exercise.color),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exercise.name),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Last Progress:'),
              LastProgress(
                progresses: exercise.progress,
                measure: exercise.measure,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
