import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/database/embedded_entity.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:collection/collection.dart';
import 'package:practice_maniac/utils/id.dart';
import 'package:practice_maniac/utils/not.dart';
import 'package:rxdart/rxdart.dart';

import 'entity.dart';

@Injectable(as: EmbeddedDataProvider)
class EmbeddedRepository implements EmbeddedDataProvider {
  late final List<EmbeddedEntity> _items;
  late final Entity _parent;

  bool _initialized = false;

  @override
  void assign<T extends Entity, K extends EmbeddedEntity>(
      T parent, List<EmbeddedEntity> items) {
    _parent = parent;
    _items = items;
    _initialized = true;
  }

  @override
  Stream<void> clear<T extends EmbeddedEntity>() {
    return _box().switchMap((items) {
      items.clear();
      return _save();
    });
  }

  @override
  Stream<T> create<T extends EmbeddedEntity>(T entity) {
    return _box().switchMap((items) {
      items.add(entity);
      return _save();
    }).mapTo(entity);
  }

  @override
  Stream<List<T>> getAll<T extends EmbeddedEntity>() {
    return _box().map((items) => [...items.cast<T>()]);
  }

  @override
  Stream<Defined<T>> getById<T extends EmbeddedEntity>(String id) {
    return _box()
        .map((items) => items.firstWhereOrNull((item) => Id(item.id).match(id)))
        .map((item) => Defined(item as T));
  }

  @override
  Stream<void> removeById<T extends EmbeddedEntity>(String id) {
    return _box().switchMap((items) {
      items.removeWhere((item) => Id(item.id).match(id));
      return _save();
    });
  }

  @override
  Stream<void> removeMany<T extends EmbeddedEntity>(List<String> ids) {
    return _box().switchMap((items) {
      items.removeWhere((item) => ids.contains(item.id));
      return _save();
    });
  }

  @override
  Stream<T> update<T extends EmbeddedEntity>(T entity) {
    return _box().switchMap((_) => _save()).mapTo(entity);
  }

  @override
  List<T> getAllSync<T extends EmbeddedEntity>() {
    return _items as List<T>;
  }

  @override
  T parent<T extends Entity>() {
    return _parent as T;
  }

  Stream<List<EmbeddedEntity>> _box() {
    if (Not(_initialized).value) {
      return Stream.error(Exception('Parent model missing!'));
    }

    return Stream.value(_items);
  }

  Stream<void> _save() {
    return _parent.update();
  }
}
