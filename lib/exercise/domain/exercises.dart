import 'package:practice_maniac/practice/domain/practice.dart';

import 'exercise.dart';

class Exercises {
  final List<Exercise> _exercises;

  Exercises() : _exercises = [];
  Exercises.from(Practice practice) : _exercises = practice.exercises;

  List<Exercise> all() {
    return [..._exercises];
  }
}
