import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/database/embedded_repository.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/utils/history.dart';

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
    return _data
        .getAll<Progress>()
        .map((progress) => History(progress).descendent());
  }

  Stream<Progress> add(Progress progress) {
    return _data.create(progress);
  }

  Stream<void> remove(Progress progress) {
    return _data.removeById(progress.id);
  }

  Stream<Progress> update(Progress progress) {
    return _data.update(progress);
  }
}
