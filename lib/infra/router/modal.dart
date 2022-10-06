import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/not.dart';
import 'package:shortid/shortid.dart';

class ModalData<T> {
  bool closed = false;

  final String _id;
  final Stream<T?> _modal;
  late final INavigator _navigator;

  Stream<Defined<T>> get onClose => _modal.map((value) => Defined(value));

  ModalData(this._id, Future<T?> modal, this._navigator)
      : _modal = Stream.fromFuture(modal).asBroadcastStream();

  void close() {
    if (_visible() && Not(closed).value) {
      _navigator.pop();
      closed = true;
    }
  }

  bool _visible() {
    final top = _navigator.stack().top().get();
    return top.name == _id;
  }
}

class ModalKey {
  final String _name;

  ModalKey(String? name) : _name = name ?? 'Modal';

  String generate() {
    return '$_name - ${shortid.generate()}';
  }
}

class Modal<T> {
  final INavigator _navigator;

  Modal(this._navigator);

  ModalData<T> open(
    WidgetBuilder builder, {
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    String? name,
    Offset? anchorPoint,
  }) {
    final context = _navigator.context();
    final id = ModalKey(name).generate();

    final modal = showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: RouteSettings(name: id),
      anchorPoint: anchorPoint,
      builder: builder,
    );

    return ModalData(id, modal, _navigator);
  }
}
