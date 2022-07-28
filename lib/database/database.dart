import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/box_adapter.dart';
import 'package:practice_maniac/database/database_adapters.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/progress/progress.dart';
import 'package:practice_maniac/tracker/tracker.dart';
import 'package:practice_maniac/utils/not.dart';

@singleton
class Database {
  late final String path;
  late final DatabaseAdapters adapters;

  Database();

  void init(String path) {
    this.path = path;
    Hive.init(path);

    adapters = DatabaseAdapters([
      BoxAdapter<Practice>(adapter: PracticeAdapter()),
      BoxAdapter<Tracker>(adapter: TrackerAdapter()),
      BoxAdapter<Progress>(adapter: ProgressAdapter()),
    ]);

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
