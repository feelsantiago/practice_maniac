import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_form/exercise_form_view.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/utils/defined.dart';

class ExerciseRoutes implements RouteModule {
  late final INavigator _navigator;

  final String _exercises = 'exercises';
  final String _create = 'exercise-create';
  final String _detail = 'exercise-detail';

  ExerciseRoutes(this._navigator);
  ExerciseRoutes.routes();

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute<Practice>(
        path: _exercises,
        builder: (context, practice) => ExerciseListView(
          practice: practice.get(),
        ),
      ),
      RxRoute<Exercise>(
        path: _create,
        builder: (context, _) => ExerciseFormView(),
      ),
      RxRoute<Exercise>(
        path: _detail,
        builder: (context, exercise) => ExerciseFormView(
          exercise: exercise.get(),
        ),
      )
    ];
  }

  Stream<void> exercises(Practice practice) {
    return _navigator.go(_exercises, arguments: practice);
  }

  Stream<Defined<Exercise>> create() {
    return _navigator.go<Exercise>(_create);
  }

  Stream<Defined<Exercise>> detail(Exercise exercise) {
    return _navigator.go<Exercise>(_detail, arguments: exercise);
  }
}
