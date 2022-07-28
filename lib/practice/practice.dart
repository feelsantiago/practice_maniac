import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/tracker/tracker.dart';

part 'practice.g.dart';

@HiveType(typeId: 1)
class Practice extends Entity {
  @HiveField(1)
  String name;

  @HiveField(2)
  int color;

  @HiveField(3)
  List<Tracker> trackers;

  Practice({
    required this.name,
    required this.color,
    List<Tracker>? trackers,
    String? id,
    DateTime? createdAt,
  })  : trackers = trackers ?? [],
        super(id: id, createdAt: createdAt);
}
