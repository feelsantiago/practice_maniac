import 'package:flutter/widgets.dart';
import 'package:practice_maniac/infra/router/route_transition.dart';
import 'package:practice_maniac/infra/router/types.dart';

abstract class RouteModule {
  List<RxRoute> build();
}

abstract class RoutesDefinition {
  List<RouteModule> routes();
  String initial();
}

class RxRoute<T extends Object> {
  final String path;
  final bool fullScreenDialogue;
  final RouteBuilder<T> builder;
  final RouteTransition transition;

  RxRoute({
    required this.path,
    required this.builder,
    this.fullScreenDialogue = false,
    this.transition = const DefaultTransition(),
  });

  Route<dynamic> build(RouteSettings settings) {
    return transition.build(settings, builder, fullScreenDialogue);
  }
}
