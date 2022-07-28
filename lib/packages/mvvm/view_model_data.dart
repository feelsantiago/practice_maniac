import 'package:practice_maniac/packages/mvvm.dart';
import 'package:observable_ish/observable_ish.dart';

class ViewModelData<T> extends ViewModel with ModelBiding<T, RxValue<T>> {
  @override
  void bind(T data) {
    model = RxValue(data);
  }

  @override
  void bindReference(RxValue<T> reference) {
    model = reference;
  }
}
