import 'package:flutter/cupertino.dart';

abstract class Selector {
  Widget build(BuildContext context);
}

class SimpleSelector implements Selector {
  final Widget element;

  SimpleSelector(this.element);

  @override
  Widget build(BuildContext context) {
    return element;
  }
}

class LazySelector implements Selector {
  final Widget Function(BuildContext context) builder;

  LazySelector(this.builder);

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class WidgetSelector extends StatelessWidget {
  final bool selector;
  final Selector onTrue;
  final Selector onFalse;

  const WidgetSelector({
    Key? key,
    required this.selector,
    required this.onTrue,
    required this.onFalse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return selector ? onTrue.build(context) : onFalse.build(context);
  }
}
