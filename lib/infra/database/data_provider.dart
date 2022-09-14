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
