import 'package:flutter/widgets.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/defined.dart';

class PracticeFormModel {
  RxValue<String> name;
  RxValue<Color> color;

  PracticeFormModel(this.name, this.color);
  PracticeFormModel.empty()
      : name = RxValue('Empty'),
        color = RxValue(const BlockColors().all.first);

  PracticeFormModel.from(Practice practice)
      : name = RxValue(practice.name),
        color = RxValue(Color(practice.color));

  static PracticeFormModel create(Practice? practice) {
    final model = Defined(practice);

    if (model.exist()) {
      return PracticeFormModel.from(model.get());
    }

    return PracticeFormModel.empty();
  }

  Practice practice() {
    return Practice(
      name: name.value,
      color: color.value.value,
    );
  }
}
