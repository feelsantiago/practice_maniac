import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/exercise/exercise.dart';
import 'package:practice_maniac/exercise/exercise_item/exercise_item_view.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view_model.dart';
import 'package:rx_widgets/rx_widgets.dart';
import 'package:practice_maniac/packages/mvvm/view_list.dart';

class ExerciseListView extends ViewList<Exercise, ExerciseViewModel> {
  RxList<Exercise> get exercises => viewModel.model;

  ExerciseListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ReactiveBuilder(
            stream: exercises.onChange,
            initialData: exercises,
            builder: (context, _) => CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      _exercises(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: viewModel.newTrackerCommand,
        ),
      ],
    );
  }

  List<Widget> _exercises() {
    return exercises
        .map(
          (tracker) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ExerciseItemView(
              key: Key(tracker.id),
              tracker: tracker,
            ),
          ),
        )
        .toList();
  }
}
