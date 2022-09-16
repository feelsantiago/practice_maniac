import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';

class ExerciseListView extends ViewList<Exercise, ExerciseViewModel> {
  RxList<Exercise> get exercises => viewModel.model;

  ExerciseListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Exercises',
      body: Container(),
    );
  }
}
