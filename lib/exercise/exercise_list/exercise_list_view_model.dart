import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/exercise.dart';
import 'package:practice_maniac/exercise/exercise_service.dart';
import 'package:rx_command/rx_command.dart';
import 'package:practice_maniac/packages/mvvm/view_model_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:practice_maniac/utils/colors_utils.dart';

@injectable
class ExerciseViewModel extends ViewModelList<Exercise> {
  final ExerciseService _exerciseService;

  late final RxCommand<void, void> newTrackerCommand;

  ExerciseViewModel(this._exerciseService) {
    newTrackerCommand = RxCommand.createSyncNoParamNoResult(_onNewTrackerCommand);
  }

  @override
  dynamic onInit() {
    return _loadTrackers();
  }

  void _onNewTrackerCommand() {
    final colors = UniqueColorList(model.map((tracker) => Color(tracker.color)));
    final color = ColorPallet().unique(colors);
    final exercise = Exercise(name: 'New Progress', measure: 'bmp', color: color.value);

    model.add(exercise);
  }

  Stream<List<Exercise>> _loadTrackers() {
    return _exerciseService.find().doOnData((trackers) {
      model.assignAll(trackers);
    });
  }
}
