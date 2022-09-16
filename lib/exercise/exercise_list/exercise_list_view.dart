import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/rx_list_disclaimer.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view_model.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

class ExerciseListView extends ViewList<Exercise, ExerciseViewModel> {
  final Practice practice;

  RxList<Exercise> get exercises => viewModel.model;

  ExerciseListView({
    Key? key,
    required this.practice,
  }) : super(key: key, model: []);

  @override
  dynamic onInit() {
    viewModel.practice = practice;
  }

  @override
  void onVisibilityGained() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: practice.name,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RxListDisclaimer(
            items: exercises,
            empty: 'No exercises been tracking...',
            full: 'Tracking exercises',
          ),
          AddBox(onTap: () {}),
        ],
      ),
    );
  }
}
