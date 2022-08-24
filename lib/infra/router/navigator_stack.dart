import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/navigator_event_observer.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/listeners_sink.dart';
import 'package:practice_maniac/utils/select.dart';

@singleton
class NavigationStack {
  final ListQueue<RouteSettings> stack = ListQueue();
  final ListenersSink _listeners = ListenersSink();

  int get length => stack.length;
  bool get empty => stack.isEmpty;
  bool get notEmpty => stack.isNotEmpty;

  void push(RouteSettings event) {
    stack.addLast(event);
  }

  RouteSettings pop() {
    return stack.removeLast();
  }

  Defined<RouteSettings> top() {
    return Select(stack.isEmpty)
        .truthy(() => Defined(null))
        .falsy(() => Defined(stack.last))
        .get();
  }

  List<RouteSettings> fetch() {
    return stack.toList();
  }

  bool contains(String route) {
    return stack.any((element) => element.name == route);
  }

  Defined<RouteSettings> remove(RouteSettings event) {
    final removed =
        stack.singleWhereOrNull((element) => element.name == event.name);

    final element = Defined(removed);
    return Select(element.exist())
        .truthy(() {
          stack.remove(element.get());
          return element;
        })
        .falsy(() => element)
        .get();
  }

  void clear() {
    stack.clear();
  }

  Future<void> listen(NavigatorEvents navigator) async {
    final observer = navigator.events();
    await _listeners.cancel();

    _listeners.sink = observer.push
        .map((event) => RouteSettings(name: event.to))
        .listen((route) => push(route));

    _listeners.sink = observer.pop.listen((event) => pop());

    _listeners.sink = observer.replace
        .map((event) => RouteSettings(name: event.to))
        .listen((route) {
      pop();
      push(route);
    });

    _listeners.sink = observer.remove
        .map((event) => RouteSettings(name: event.to))
        .listen((route) => remove(route));
  }
}
