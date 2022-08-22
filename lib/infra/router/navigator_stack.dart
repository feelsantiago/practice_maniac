import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/select.dart';

class NavigationStack {
  final ListQueue<RouteSettings> stack = ListQueue();

  int get length => stack.length;

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

  List<RouteSettings> fetchAll() {
    return stack.toList();
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
}
