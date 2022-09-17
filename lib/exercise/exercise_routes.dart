import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/exercise_form/exercise_form_view.dart';
import 'package:practice_maniac/exercise/exercise_list/exercise_list_view.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

class ExerciseRoutes implements RouteModule {
  final String exercises = 'exercises';
  final String create = 'exercise-create';
  final String detail = 'exercise-detail';

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute<Practice>(
        path: exercises,
        builder: (context, practice) => ExerciseListView(
          practice: practice.get(),
        ),
      ),
      RxRoute<Exercise>(
        path: create,
        builder: (context, _) => ExerciseFormView(),
      ),
      RxRoute<Exercise>(
        path: detail,
        builder: (context, exercise) => ExerciseFormView(
          exercise: exercise.get(),
        ),
      )
    ];
  }
}
