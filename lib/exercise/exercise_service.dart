import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:rxdart/rxdart.dart';

import 'exercise.dart';

@singleton
class ExerciseService {
  final DataProvider _repository;

  ExerciseService(this._repository);

  Stream<List<Exercise>> find() {
    return _repository
        .getAll<Practice>()
        .doOnData((event) => print(event))
        .map((practice) => practice.first.exercises);
  }
}
