import 'package:hive/hive.dart';
import 'package:practice_maniac/utils/history.dart';
import 'package:uuid/uuid.dart';

abstract class Entity extends HiveObject implements Birth {
  @HiveField(100)
  late String id;
  @HiveField(101)
  late DateTime createdAt;

  Entity({String? id, DateTime? createdAt})
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  @override
  DateTime date() {
    return createdAt;
  }

  Stream<Entity> update() {
    return Stream.fromFuture(save()).map((_) => this);
  }
}
