import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/practice_routes.dart';

@Injectable(as: RoutesDefinition)
class Routes implements RoutesDefinition {
  @override
  List<RouteModule> routes() => [
        PracticeRoutes(),
      ];

  @override
  String initial() => PracticeRoutes().practice;
}
