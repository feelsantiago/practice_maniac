import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/database.dart';

import 'entity.dart';

@injectable
class Repository {
  final Database _database;

  Repository(this._database);

  Future<T> create<T extends Entity>(T entity) async {
    final box = await _database.box<T>();

    entity.createdAt = DateTime.now();
    box.put(entity.id, entity);

    return entity;
  }

  Future<T> update<T extends Entity>(T entity) async {
    final box = await _database.box<T>();

    box.put(entity.id, entity);
    return entity;
  }

  Future<T?> getById<T extends Entity>(String id) async {
    final box = await _database.box<T>();
    return box.get(id);
  }

  Future<List<T>> getAll<T extends Entity>() async {
    final box = await _database.box<T>();
    return box.values.toList();
  }

  Future<void> removeById<T extends Entity>(String id) async {
    final box = await _database.box<T>();
    return box.delete(id);
  }

  Future<void> removeMany<T extends Entity>(List<String> keys) async {
    final box = await _database.box<T>();
    return box.deleteAll(keys);
  }
}
