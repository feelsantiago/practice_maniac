import 'package:hive/hive.dart';
import 'package:practice_maniac/infra/database/embedded_entity.dart';

part 'progress.g.dart';

@HiveType(typeId: 3)
class Progress extends EmbeddedEntity {
  @HiveField(1)
  int value;

  Progress({
    required this.value,
    String? id,
    DateTime? createdAt,
  }) : super(id: id, createdAt: createdAt);

  void edit(Progress progress) {
    value = progress.value;
  }
}
