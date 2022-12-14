import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/infra/database/entity.dart';
import 'package:practice_maniac/utils/empty_string.dart';

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

  Practice.empty()
      : name = EmptyString.empty(),
        color = 1,
        exercises = [];

  Color paint() {
    return Color(color);
  }

  void edit(Practice practice) {
    name = practice.name;
    color = practice.color;
  }

  Practice copyWith({
    String? name,
    int? color,
    List<Exercise>? exercises,
    String? id,
    DateTime? createdAt,
  }) {
    return Practice(
      name: name ?? this.name,
      color: color ?? this.color,
      exercises: exercises ?? this.exercises,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
