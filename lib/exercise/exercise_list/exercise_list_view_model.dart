import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class ExerciseViewModel extends ViewModelList<Exercise> {
  late final Practice practice;
  late final Exercises exercises;

  late final RxCommand<void, List<Exercise>> fetch;

  ExerciseViewModel() {
    fetch = RxCommand.createSyncNoParam(_onFetch);

    commands([fetch]);
  }

  @override
  dynamic onInit() {
    exercises = Exercises.from(practice);
  }

  List<Exercise> _onFetch() {
    model.assignAll(exercises.all());
    return model;
  }
}
