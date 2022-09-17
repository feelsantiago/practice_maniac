import 'package:flutter/material.dart';
import 'package:practice_maniac/utils/defined.dart';

enum NavigationType { push, pop, replace, remove }
typedef RouteBuilder<T extends Object> = Widget Function(
    BuildContext context, Defined<T> arguments);
typedef TransitionBuilder = Widget Function(BuildContext context,
    Animation<double> animation, Animation<double> secondary, Widget child);

class RouteNavigationEvent {
  final NavigationType type;
  final String from;
  final String to;

  RouteNavigationEvent(this.type, this.from, this.to);
}

class RouteName {
  final Route<dynamic>? route;

  RouteName(this.route);

  String extract() {
    return route?.settings.name ?? 'Unknown route';
  }
}

class NavigationEvents {
  Stream<RouteNavigationEvent> push;
  Stream<RouteNavigationEvent> pop;
  Stream<RouteNavigationEvent> replace;
  Stream<RouteNavigationEvent> remove;

  NavigationEvents({
    required this.push,
    required this.pop,
    required this.replace,
    required this.remove,
  });
}
