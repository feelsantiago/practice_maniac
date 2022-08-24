import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/navigator_stack.dart';
import 'package:practice_maniac/utils/defined.dart';

abstract class INavigator {
  GlobalKey<NavigatorState> state();
  Future<T?> go<T extends Object>(String route, {Object? arguments});
  Future<T?> push<T extends Object>(String route, {Object? arguments});
  Future<T?> replace<T extends Object>(String route, {Object? arguments});
  void pop<T extends Object>([T? result]);
  void popUntil(String route);
  void replaceAll(String route, {Object? arguments});
  bool canPop();
}

@Singleton(as: INavigator)
class GlobalNavigator implements INavigator {
  final GlobalKey<NavigatorState> _state;
  final NavigationStack stack;

  Defined<RouteSettings> get top => stack.top();
  NavigatorState get navigator => _state.currentState!;

  GlobalNavigator(this.stack) : _state = GlobalKey<NavigatorState>();
  GlobalNavigator.state(this._state, this.stack);

  @override
  GlobalKey<NavigatorState> state() {
    return _state;
  }

  @override
  bool canPop() {
    return stack.notEmpty && navigator.canPop();
  }

  @override
  void pop<T extends Object>([T? result]) {
    if (canPop()) {
      navigator.pop();
    }
  }

  @override
  void popUntil(String route) {
    if (canPop()) {
      navigator.popUntil((page) => page.settings.name == route);
    }
  }

  @override
  Future<T?> go<T extends Object>(String route, {Object? arguments}) {
    if (stack.contains(route)) {
      popUntil(route);
      pop();
    }

    return push(route, arguments: arguments);
  }

  @override
  Future<T?> push<T extends Object>(String route, {Object? arguments}) {
    return navigator.pushNamed(route, arguments: arguments);
  }

  @override
  Future<T?> replace<T extends Object>(String route, {Object? arguments}) {
    return navigator.pushReplacementNamed(route, arguments: arguments);
  }

  @override
  void replaceAll(String route, {Object? arguments}) {
    navigator.pushNamedAndRemoveUntil(route, (route) => false,
        arguments: arguments);
  }
}
