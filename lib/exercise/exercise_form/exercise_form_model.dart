import 'dart:ui';

import 'package:observable_ish/value/value.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/empty_string.dart';

class ExerciseFormModel {
  RxValue<String> name;
  RxValue<String> measure;
  RxValue<Color> color;

  ExerciseFormModel(this.name, this.measure, this.color);
  ExerciseFormModel.empty()
      : name = RxValue(EmptyString.empty()),
        measure = RxValue(EmptyString.empty()),
        color = RxValue(const BlockColors().all.first);

  ExerciseFormModel.from(Exercise exercise)
      : name = RxValue(exercise.name),
        measure = RxValue(exercise.measure),
        color = RxValue(Color(exercise.color));

  static ExerciseFormModel create(Exercise? exercise) {
    final model = Defined(exercise);

    if (model.exist()) {
      return ExerciseFormModel.from(model.get());
    }

    return ExerciseFormModel.empty();
  }

  Exercise model() {
    return Exercise(
      name: name.value,
      measure: measure.value,
      color: color.value.value,
    );
  }
}
