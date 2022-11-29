import 'package:flutter/material.dart';

abstract class FitStrategy {
  Widget wrapper(Widget widget);
}

class ExpandToFit implements FitStrategy {
  const ExpandToFit();

  @override
  Widget wrapper(Widget content, {Key? key}) {
    return Expanded(key: key, child: content);
  }
}

class FitOnly implements FitStrategy {
  const FitOnly();

  @override
  Widget wrapper(Widget widget) {
    return widget;
  }
}
