import 'package:flutter/material.dart';

abstract class Navigator {
  GlobalKey<NavigatorState> state();
}

class NavigatorFake implements Navigator {
  GlobalKey<NavigatorState> fake;

  NavigatorFake(this.fake);

  @override
  GlobalKey<NavigatorState> state() {
    return fake;
  }
}

class GlobalNavigator implements Navigator {
  final GlobalKey<NavigatorState> _state = GlobalKey();

  @override
  GlobalKey<NavigatorState> state() {
    return _state;
  }
}
