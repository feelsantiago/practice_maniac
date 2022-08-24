import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/app/startup.dart';
import 'package:practice_maniac/infra/mvvm/view_model.dart';
import 'package:practice_maniac/infra/router/navigation_observer.dart';
import 'package:practice_maniac/infra/router/navigator.dart';

@injectable
class PracticeManiacViewModel extends ViewModel {
  final Startup _startup;
  final INavigator _navigator;

  late final NavigationObserver navigation;

  GlobalKey<NavigatorState> get navigator => _navigator.state();

  PracticeManiacViewModel(this._startup, this._navigator);

  @override
  dynamic onInit() async {
    navigation = NavigationObserver();
    await _startup.init(navigation);
  }
}
