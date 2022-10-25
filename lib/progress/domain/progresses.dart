import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/database/embedded_repository.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

import 'progress.dart';

class Progresses {
  final String exercise;
  final String measure;

  final EmbeddedDataProvider _data;

  Progresses(this.exercise, this.measure, this._data);
  Progresses.empty()
      : _data = EmbeddedRepository(),
        exercise = 'empty',
        measure = 'unknown';
  Progresses.from(Practice practice, Exercise exercise)
      : _data = EmbeddedRepository(),
        measure = exercise.measure,
        exercise = exercise.name {
    _data.assign(practice, exercise.progress);
  }

  Stream<List<Progress>> all() {
    return _data.getAll<Progress>();
  }

  Stream<Progress> add(Progress exercise) {
    return _data.create(exercise);
  }

  Stream<void> remove(Progress exercise) {
    return _data.removeById(exercise.id);
  }

  Stream<Progress> update(Progress exercise) {
    return _data.update(exercise);
  }
}
