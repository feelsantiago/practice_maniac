import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/database/embedded_repository.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

import 'exercise.dart';

class Exercises {
  final EmbeddedDataProvider _data;

  Practice get parent => _data.parent<Practice>();

  Exercises(this._data);
  Exercises.empty() : _data = EmbeddedRepository();
  Exercises.from(Practice practice) : _data = EmbeddedRepository() {
    _data.assign(practice, practice.exercises);
  }

  Stream<List<Exercise>> all() {
    return _data.getAll<Exercise>();
  }

  Stream<Exercise> add(Exercise exercise) {
    return _data.create(exercise);
  }

  Stream<void> remove(Exercise exercise) {
    return _data.removeById(exercise.id);
  }

  Stream<Exercise> update(Exercise exercise) {
    return _data.update(exercise);
  }
}
