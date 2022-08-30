import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';

@injectable
class RouterBuilder {
  final RoutesDefinition definition;
  final Map<String, RxRoute> routes = {};

  String get initial => definition.initial();

  RouterBuilder(this.definition);

  void build() {
    definition
        .routes()
        .map((module) => module.build())
        .fold<List<RxRoute>>([], (acc, next) => [...acc, ...next]).forEach(
            (route) => routes.addAll({route.path: route}));
  }

  Route find(RouteSettings settings) {
    final route = routes[settings.name]!;
    return route.build(settings);
  }
}
