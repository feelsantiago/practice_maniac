import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/router/navigator_stack.dart';
import 'package:practice_maniac/utils/defined.dart';

abstract class INavigator {
  GlobalKey<NavigatorState> state();
  BuildContext context();
  NavigationStack stack();
  Stream<Defined<T>> go<T extends Object>(String route, {Object? arguments});
  Stream<Defined<T>> push<T extends Object>(String route, {Object? arguments});
  Stream<Defined<T>> replace<T extends Object>(String route,
      {Object? arguments});
  Future<Defined<T>> goAsync<T extends Object>(String route,
      {Object? arguments});
  Future<Defined<T>> pushAsync<T extends Object>(String route,
      {Object? arguments});
  Future<Defined<T>> replaceAsync<T extends Object>(String route,
      {Object? arguments});
  void pop<T extends Object>([T? result]);
  void popUntil(String route);
  void replaceAll(String route, {Object? arguments});
  bool canPop();
}

@Singleton(as: INavigator)
class GlobalNavigator implements INavigator {
  final GlobalKey<NavigatorState> _state;
  final NavigationStack _stack;

  Defined<RouteSettings> get top => _stack.top();
  NavigatorState get navigator => _state.currentState!;

  GlobalNavigator(this._stack) : _state = GlobalKey<NavigatorState>();
  GlobalNavigator.state(this._state, this._stack);

  @override
  GlobalKey<NavigatorState> state() {
    return _state;
  }

  @override
  NavigationStack stack() {
    return _stack;
  }

  @override
  BuildContext context() {
    final context = Defined(_state.currentContext);

    if (context.not.exist()) {
      throw Exception('[Navigator] - no context defined');
    }

    return context.get();
  }

  @override
  bool canPop() {
    return _stack.notEmpty && navigator.canPop();
  }

  @override
  void pop<T extends Object>([T? result]) {
    if (canPop()) {
      navigator.pop(result);
    }
  }

  @override
  void popUntil(String route) {
    if (canPop()) {
      navigator.popUntil((page) => page.settings.name == route);
    }
  }

  @override
  Future<Defined<T>> goAsync<T extends Object>(String route,
      {Object? arguments}) {
    if (_stack.contains(route)) {
      popUntil(route);
      pop();
    }

    return pushAsync(route, arguments: arguments);
  }

  @override
  Future<Defined<T>> pushAsync<T extends Object>(String route,
      {Object? arguments}) async {
    final result = await navigator.pushNamed<T>(route, arguments: arguments);
    return Defined(result);
  }

  @override
  Future<Defined<T>> replaceAsync<T extends Object>(String route,
      {Object? arguments}) async {
    final result = await navigator.pushReplacementNamed<T, Object>(route,
        arguments: arguments);

    return Defined(result);
  }

  @override
  Stream<Defined<T>> go<T extends Object>(String route, {Object? arguments}) {
    return Stream.fromFuture(goAsync<T>(route, arguments: arguments));
  }

  @override
  Stream<Defined<T>> push<T extends Object>(String route, {Object? arguments}) {
    return Stream.fromFuture(pushAsync<T>(route, arguments: arguments));
  }

  @override
  Stream<Defined<T>> replace<T extends Object>(String route,
      {Object? arguments}) {
    return Stream.fromFuture(replaceAsync(route, arguments: arguments));
  }

  @override
  void replaceAll(String route, {Object? arguments}) {
    navigator.pushNamedAndRemoveUntil(route, (route) => false,
        arguments: arguments);
  }
}
