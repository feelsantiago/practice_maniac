import 'package:practice_maniac/exercise/exercise_list/exercise_list_view.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

class ExerciseRoutes implements RouteModule {
  final String exercises = 'exercises';

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute<Practice>(
        path: exercises,
        builder: (context, practice) => ExerciseListView(
          practice: practice!,
        ),
      ),
    ];
  }
}
