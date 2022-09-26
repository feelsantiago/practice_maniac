import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/exercise/exercise_routes.dart';
import 'package:practice_maniac/infra/mvvm/view_model_data.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/progress.dart';
import 'package:practice_maniac/progress/progress_routes.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ExerciseItemViewModel extends ViewModelData<Exercise> {
  final INavigator _navigator;
  late final Exercises exercises;

  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;
  late final RxCommand<void, void> detail;

  ExerciseItemViewModel(this._navigator) {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createFromStream((_) => _onEdit());
    detail = RxCommand.createSyncNoParamNoResult(_onDetail);

    commands([remove, edit, detail]);
  }

  void _onDetail() {
    ProgressRoutes(_navigator).progress();
  }

  Stream<void> _onRemove() {
    return exercises.remove(model.value);
  }

  Stream<void> _onEdit() {
    return ExerciseRoutes(_navigator)
        .detail(model.value)
        .where((exercise) => exercise.exist())
        .doOnData((exercise) => model.value.edit(exercise.get()))
        .switchMap((_) => exercises.update(model.value));
  }
}
