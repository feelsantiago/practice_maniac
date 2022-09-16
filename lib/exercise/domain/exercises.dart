import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

import 'exercise.dart';

class Exercises {
  final EmbeddedDataProvider _data;

  Exercises(this._data);
  Exercises.from(Practice practice, this._data) {
    _data.assign(practice, practice.exercises);
  }

  Stream<List<Exercise>> all() {
    return _data.getAll<Exercise>();
  }
}
