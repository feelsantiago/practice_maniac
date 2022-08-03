import 'package:observable_ish/value/value.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:flutter/widgets.dart';

abstract class ViewData<K, T extends ViewModelData<K>> extends View<T> {
  final RxValue<K> model;

  ViewData({Key? key, required K model})
      : model = RxValue(model),
        super(key: key);

  @override
  void binds() {
    viewModel.bindReference(model);
  }
}
