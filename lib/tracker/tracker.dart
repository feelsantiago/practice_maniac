import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/progress/progress.dart';

part 'tracker.g.dart';

@HiveType(typeId: 2)
class Tracker extends Entity {
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String measure;

  @HiveField(3)
  final Color color;

  @HiveField(4)
  final List<Progress> progress;

  Tracker({
    required this.name,
    required this.measure,
    required this.color,
    List<Progress>? progress,
    String? id,
    DateTime? createdAt,
  })  : progress = progress ?? [],
        super(id: id, createdAt: createdAt);
}
