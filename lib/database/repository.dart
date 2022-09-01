import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/database.dart';

import 'entity.dart';

@injectable
class Repository {
  final Database _database;

  Repository(this._database);

  Stream<T> create<T extends Entity>(T entity) {
    return _box<T>().map((box) {
      entity.createdAt = DateTime.now();
      box.put(entity.id, entity);

      return entity;
    });
  }

  Stream<T> update<T extends Entity>(T entity) {
    return _box<T>().map((box) {
      box.put(entity.id, entity);
      return entity;
    });
  }

  Stream<T?> getById<T extends Entity>(String id) {
    return _box<T>().map((box) => box.get(id));
  }

  Stream<List<T>> getAll<T extends Entity>() {
    return _box<T>().map((box) => box.values.toList());
  }

  Stream<void> removeById<T extends Entity>(String id) {
    return _box<T>().map((box) => box.delete(id));
  }

  Stream<void> removeMany<T extends Entity>(List<String> ids) {
    return _box<T>().map((box) => box.deleteAll(ids));
  }

  Stream<Box<T>> _box<T extends Entity>() {
    return Stream.fromFuture(_database.box<T>());
  }
}
