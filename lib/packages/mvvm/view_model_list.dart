import 'package:practice_maniac/packages/mvvm.dart';
import 'package:observable_ish/list/list.dart';

class ViewModelList<T> extends ViewModel with ModelBiding<List<T>, RxList<T>> {
  @override
  void bind(List<T> data) {
    model = RxList.from(data);
  }

  @override
  void bindReference(RxList<T> reference) {
    model = reference;
  }
}
