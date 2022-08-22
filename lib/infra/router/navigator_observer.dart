import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'types.dart';

class NavigatorObserver extends RouteObserver<PageRoute<dynamic>> {
  String lastPushTo = '';
  String lastPushFrom = '';
  String lastReplaceTo = '';
  String lastReplaceFrom = '';
  String lastPopTo = '';
  String lastPopFrom = '';
  String lastRemoveTo = '';
  String lastRemoveFrom = '';

  final BehaviorSubject<RouteNavigationEvent> _events = BehaviorSubject();

  late Stream<RouteNavigationEvent> events;
  late Stream<RouteNavigationEvent> push;
  late Stream<RouteNavigationEvent> replace;
  late Stream<RouteNavigationEvent> pop;
  late Stream<RouteNavigationEvent> remove;

  NavigatorObserver() {
    events = _events.stream;
    push = events.where((event) => event.type == NavigationType.push);
    replace = events.where((event) => event.type == NavigationType.replace);
    pop = events.where((event) => event.type == NavigationType.pop);
    remove = events.where((event) => event.type == NavigationType.remove);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    lastPushFrom = RouteName(previousRoute).extract();
    lastPushTo = RouteName(route).extract();
    _events.sink.add(
        RouteNavigationEvent(NavigationType.push, lastPushFrom, lastPushTo));
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    lastReplaceFrom = RouteName(oldRoute).extract();
    lastReplaceTo = newRoute?.settings.name ?? lastReplaceTo;
    lastReplaceTo = RouteName(newRoute).extract();
    _events.sink.add(RouteNavigationEvent(
        NavigationType.replace, lastReplaceFrom, lastReplaceTo));
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    lastPopFrom = RouteName(route).extract();
    lastPopTo = RouteName(previousRoute).extract();
    _events.sink
        .add(RouteNavigationEvent(NavigationType.pop, lastPopFrom, lastPopTo));
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    lastRemoveFrom = RouteName(route).extract();
    lastRemoveTo = RouteName(previousRoute).extract();
    _events.sink.add(RouteNavigationEvent(
        NavigationType.remove, lastRemoveFrom, lastRemoveTo));
  }
}
