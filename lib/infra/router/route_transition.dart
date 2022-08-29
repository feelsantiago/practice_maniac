import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/router/types.dart';

abstract class RouteTransition {
  Route<dynamic> build<T extends Object>(
      RouteSettings settings, RouteBuilder<T> builder, bool fullScreenDialog);
}

class DefaultTransition implements RouteTransition {
  const DefaultTransition();

  @override
  Route<dynamic> build<T extends Object>(
      RouteSettings settings, RouteBuilder<T> builder, bool fullScreenDialog) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(context, settings.arguments as T?),
      fullscreenDialog: fullScreenDialog,
    );
  }
}

class SlideRightTransition implements RouteTransition {
  final bool opaque;

  SlideRightTransition({this.opaque = false});

  @override
  Route build<T extends Object>(
      RouteSettings settings, RouteBuilder<T> builder, bool fullScreenDialog) {
    return PageRouteBuilder(
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      opaque: opaque,
      pageBuilder: (context, _, __) =>
          builder(context, settings.arguments as T?),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
