import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/packages/mvvm.dart';
import 'package:flutter/widgets.dart';

abstract class ViewList<K, T extends ViewModelList<K>> extends View<T> {
  final RxList<K> model;

  ViewList({Key? key, required List<K> model})
      : model = RxList.from(model),
        super(key: key);

  @override
  void binds() {
    viewModel.bindReference(model);
  }
}
