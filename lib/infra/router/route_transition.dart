import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/router/types.dart';

abstract class RouteTransition {
  Route<Object> build<T extends Object>(
      RouteSettings settings, RouteBuilder<T> builder, bool fullScreenDialog);
}

class DefaultTransition implements RouteTransition {
  const DefaultTransition();

  @override
  Route<Object> build<T extends Object>(
      RouteSettings settings, RouteBuilder<T> builder, bool fullScreenDialog) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(context, settings.arguments as T?),
      fullscreenDialog: fullScreenDialog,
    );
  }
}

// Transitions found in: https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823

class SlideRightTransition implements RouteTransition {
  final bool opaque;

  SlideRightTransition({this.opaque = false});

  @override
  Route<Object> build<T extends Object>(
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
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

class ScalingTransition implements RouteTransition {
  final bool opaque;

  ScalingTransition({this.opaque = false});

  @override
  Route<Object> build<T extends Object>(
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
      ) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        );
      },
    );
  }
}

class RotateTransition implements RouteTransition {
  final bool opaque;

  RotateTransition({this.opaque = false});

  @override
  Route<Object> build<T extends Object>(
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
      ) {
        return RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        );
      },
    );
  }
}

class SizeChangeTransition implements RouteTransition {
  final bool opaque;

  SizeChangeTransition({this.opaque = false});

  @override
  Route<Object> build<T extends Object>(
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
      ) {
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
    );
  }
}

class FadingTransition implements RouteTransition {
  final bool opaque;

  FadingTransition({this.opaque = false});

  @override
  Route<Object> build<T extends Object>(
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
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
