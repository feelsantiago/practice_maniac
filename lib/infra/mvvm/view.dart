import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/configuration/injection.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/mvvm/view_model_provider.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/utils/listeners_sink.dart';
import 'package:rx_widgets_plus/rx_widgets_plus.dart';
import 'package:rxdart/rxdart.dart';

abstract class View<T extends ViewModel> extends StatefulWidget {
  final ViewModelProvider<T> provider = ViewModelProvider<T>();
  T get viewModel => provider.viewModel;

  final ListenersSink listeners = ListenersSink();

  INavigator get navigator => getIt<INavigator>();

  View({Key? key}) : super(key: key);

  Widget build(BuildContext context);

  void binds() {}

  /// This function is called once when widget is created
  ///
  /// You can return a [value], a [Future] or a [Stream]
  ///
  /// When a async operation is returned the app will show a [CircularProgressBar]
  FutureOr onInit() {}

  /// This function is called every time before a build
  ///
  /// You can return a [value], a [Future] or a [Stream]
  ///
  /// When a async operation is returned the app will show a [CircularProgressBar]
  FutureOr didUpdateWidget() {}

  void didChangeDependencies() {}
  void deactivate() {}
  void dispose() {}

  /// Triggered when either [onVisibilityLost] or [onForegroundLost] is called.
  /// Equivalent to onPause() on Android or viewDidDisappear() on iOS.
  void onFocusLost() {}

  /// Triggered when either [onVisibilityGained] or [onForegroundGained] is called.
  /// Equivalent to onResume() on Android or viewDidAppear() on iOS.
  void onFocusGained() {}

  /// It means the widget is no longer visible within your app.
  void onVisibilityLost() {}

  /// It means the widget is now visible within your app.
  void onVisibilityGained() {}

  /// It means, for example, that the user sent your app to the background by opening
  /// another app or turned off the device\'s screen while your widget was visible.
  void onForegroundLost() {}

  /// It means, for example, that the user switched back to your app or turned the
  /// device's screen back on while your widget was visible.
  void onForegroundGained() {}

  @override
  State<StatefulWidget> createState() => _ViewState<T>();
}

class _ViewState<T extends ViewModel> extends State<View<T>> {
  late Stream<bool> onInit;
  final ViewModelProvider<T> provider = ViewModelProvider<T>();

  final BehaviorSubject<bool> _onUpdateWidgetController = BehaviorSubject();

  @override
  void initState() {
    super.initState();

    widget.provider.setup(provider.viewModel);
    widget.binds();

    onInit = LoadingStream.many([
      FutureOrToStream.from(widget.onInit),
      FutureOrToStream.from(widget.viewModel.onInit),
    ]).combine();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusLost: widget.onFocusLost,
      onFocusGained: widget.onFocusGained,
      onVisibilityLost: widget.onVisibilityLost,
      onVisibilityGained: widget.onVisibilityGained,
      onForegroundLost: widget.onForegroundLost,
      onForegroundGained: widget.onForegroundGained,
      child: ReactiveBuilder<bool>(
        stream: MergeStream([
          onInit,
          _onUpdateWidgetController.stream.switchMap((_) => LoadingStream.many([
                FutureOrToStream.from(widget.didUpdateWidget),
                FutureOrToStream.from(widget.viewModel.onUpdate),
              ]).combine())
        ]).distinct(),
        builder: (context, loading) {
          if (loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          widget.provider.setup(provider.viewModel);
          return widget.build(context);
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant View<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.provider.setup(provider.viewModel);
    _onUpdateWidgetController.sink.add(true);
  }

  @override
  void deactivate() {
    widget.deactivate();
    super.deactivate();
  }

  @override
  void dispose() {
    widget.listeners.cancel();
    widget.dispose();
    widget.viewModel.onDispose();
    _onUpdateWidgetController.close();
    super.dispose();
  }
}
