import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/exercise/exercise.dart';

part 'practice.g.dart';

@HiveType(typeId: 1)
class Practice extends Entity {
  @HiveField(1)
  String name;

  @HiveField(2)
  int color;

  @HiveField(3)
  List<Exercise> exercises;

  Practice({
    required this.name,
    required this.color,
    List<Exercise>? exercises,
    String? id,
    DateTime? createdAt,
  })  : exercises = exercises ?? [],
        super(id: id, createdAt: createdAt);
}
