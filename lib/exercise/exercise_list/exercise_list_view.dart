import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/reactive_list.dart';
import 'package:practice_maniac/components/rx_list_disclaimer.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/exercise/exercise_item/exercise_item_view.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';

class ExerciseListView extends ViewList<Exercise, ExerciseViewModel> {
  final Exercises _provider;

  RxList<Exercise> get exercises => viewModel.model;

  ExerciseListView({
    Key? key,
    required Exercises exercises,
  })  : _provider = exercises,
        super(key: key, model: []);

  @override
  dynamic onInit() {
    viewModel.exercises = _provider;
  }

  @override
  void onVisibilityGained() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: _provider.parent.name,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RxListDisclaimer(
            items: exercises,
            empty: 'No exercises been tracking...',
            full: 'Tracking exercises',
          ),
          AddBox(onTap: viewModel.create),
          ReactiveList(
            items: exercises,
            builder: (_) => _exercises(),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _exercises() {
    return exercises.map(
      (exercise) => ExerciseItemView(
        exercise: exercise,
        exercises: viewModel.exercises,
      ),
    );
  }
}
