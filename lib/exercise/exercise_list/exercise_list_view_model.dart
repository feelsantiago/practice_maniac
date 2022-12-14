import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/exercise/exercise_routes.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ExerciseViewModel extends ViewModelList<Exercise> {
  final INavigator _navigator;

  late final Exercises exercises;

  late final RxCommand<void, List<Exercise>> fetch;
  late final RxCommand<void, Exercise> create;

  ExerciseViewModel(this._navigator) {
    fetch = RxCommand.createFromStream((_) => _onFetch());
    create = RxCommand.createFromStream((_) => _onCreate());

    commands([fetch, create]);
  }

  Stream<List<Exercise>> _onFetch() {
    return exercises.all().doOnData((exercises) => model.assignAll(exercises));
  }

  Stream<Exercise> _onCreate() {
    return ExerciseRoutes(_navigator)
        .create()
        .where((exercise) => exercise.exist())
        .switchMap((exercise) => exercises.add(exercise.get()))
        .doOnData((exercise) => model.add(exercise));
  }
}
