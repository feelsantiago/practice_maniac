import 'package:practice_maniac/infra/database/embedded_entity.dart';
import 'package:practice_maniac/utils/defined.dart';

import 'entity.dart';

abstract class DataProvider {
  Stream<T> create<T extends Entity>(T entity);
  Stream<T> update<T extends Entity>(T entity);
  Stream<Defined<T>> getById<T extends Entity>(String id);
  Stream<List<T>> getAll<T extends Entity>();
  Stream<void> removeById<T extends Entity>(String id);
  Stream<void> removeMany<T extends Entity>(List<String> ids);
  Stream<void> clear<T extends Entity>();
}

abstract class EmbeddedDataProvider {
  Stream<T> create<T extends EmbeddedEntity>(T entity);
  Stream<T> update<T extends EmbeddedEntity>(T entity);
  Stream<Defined<T>> getById<T extends EmbeddedEntity>(String id);
  Stream<List<T>> getAll<T extends EmbeddedEntity>();
  Stream<void> removeById<T extends EmbeddedEntity>(String id);
  Stream<void> removeMany<T extends EmbeddedEntity>(List<String> ids);
  Stream<void> clear<T extends EmbeddedEntity>();
  void assign<T extends Entity, K extends EmbeddedEntity>(
      T parent, List<K> items);
  T parent<T extends Entity>();
}
