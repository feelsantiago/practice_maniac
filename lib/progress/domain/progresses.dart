import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/database/embedded_repository.dart';
import 'package:practice_maniac/practice/domain/practice.dart';

import 'progress.dart';

class Progresses {
  final String measure;

  final EmbeddedDataProvider _data;

  Progresses(this.measure, this._data);
  Progresses.empty()
      : _data = EmbeddedRepository(),
        measure = 'unknown';
  Progresses.from(Practice practice, this.measure, List<Progress> progresses)
      : _data = EmbeddedRepository() {
    _data.assign(practice, progresses);
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
