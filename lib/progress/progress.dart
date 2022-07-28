import 'package:hive/hive.dart';
import 'package:practice_maniac/database/entity.dart';

part 'progress.g.dart';

@HiveType(typeId: 3)
class Progress extends Entity {
  @HiveField(1)
  final String value;

  Progress({
    required this.value,
    String? id,
    DateTime? createdAt,
  }) : super(id: id, createdAt: createdAt);
}
