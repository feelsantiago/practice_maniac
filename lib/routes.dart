import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/exercise_routes.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:practice_maniac/progress/progress_routes.dart';

@Injectable(as: RoutesDefinition)
class Routes implements RoutesDefinition {
  @override
  List<RouteModule> routes() => [
        PracticeRoutes(),
        ExerciseRoutes(),
        ProgressRoutes(),
      ];

  @override
  String initial() => PracticeRoutes().practices;
}
