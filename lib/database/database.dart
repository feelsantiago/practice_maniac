import 'package:hive/hive.dart';
import 'package:practice_maniac/database/database_adapters.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/utils/not.dart';

class Database {
  late final String path;
  late final DatabaseAdapters adapters;

  Database(this.path);

  void init() {
    Hive.init(path);

    adapters = DatabaseAdapters([]);

    adapters.register();
  }

  Future<Box<E>> box<E extends Entity>() async {
    final adapter = adapters.get<E>();

    if (Not(adapter.isOpen).value) {
      await adapter.open();
    }

    return adapter.box;
  }

  Future<void> close() async {
    return Hive.close();
  }
}
