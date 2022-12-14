import 'package:hive/hive.dart';
import 'package:practice_maniac/infra/database/embedded_entity.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

part 'exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends EmbeddedEntity {
  @HiveField(1)
  String name;

  @HiveField(2)
  String measure;

  @HiveField(3)
  int color;

  @HiveField(4)
  final List<Progress> progress;

  Exercise({
    required this.name,
    required this.measure,
    required this.color,
    List<Progress>? progress,
    String? id,
    DateTime? createdAt,
  })  : progress = progress ?? [],
        super(id: id, createdAt: createdAt);

  void edit(Exercise exercise) {
    name = exercise.name;
    measure = exercise.measure;
    color = exercise.color;
  }
}
