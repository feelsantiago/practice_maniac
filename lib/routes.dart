import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/practice_routes.dart';

@injectable
class Routes {
  final List<RouteModule> routes = [
    PracticeRoutes(),
  ];

  final String initial = PracticeRoutes().practice;
}
