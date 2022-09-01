import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract class Entity extends HiveObject {
  @HiveField(100)
  late String id;
  @HiveField(101)
  late DateTime createdAt;

  Entity({String? id, DateTime? createdAt})
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();
}
