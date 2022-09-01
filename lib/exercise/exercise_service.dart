import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/repository.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:rxdart/rxdart.dart';

import 'exercise.dart';

@singleton
class ExerciseService {
  final Repository _repository;

  ExerciseService(this._repository);

  Stream<List<Exercise>> find() {
    return _repository
        .getAll<Practice>()
        .doOnData((event) => print(event))
        .map((practice) => practice.first.exercises);
  }
}
