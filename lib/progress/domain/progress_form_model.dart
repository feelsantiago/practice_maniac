import 'package:observable_ish/observable_ish.dart';
import 'package:practice_maniac/utils/defined.dart';

import 'progress.dart';

class ProgressFormModel {
  RxValue<int> value;

  ProgressFormModel(this.value);
  ProgressFormModel.empty() : value = RxValue(0);
  ProgressFormModel.from(Progress progress) : value = RxValue(progress.value);

  static ProgressFormModel create(Progress? progress) {
    final model = Defined(progress);

    if (model.exist()) {
      return ProgressFormModel.from(model.get());
    }

    return ProgressFormModel.empty();
  }

  Progress model() {
    return Progress(
      value: value.value,
      createdAt: DateTime.now(),
    );
  }
}
