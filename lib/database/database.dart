import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/box_adapter.dart';
import 'package:practice_maniac/database/database_adapters.dart';
import 'package:practice_maniac/database/database_path_provider.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/exercise/exercise.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/progress/progress.dart';
import 'package:practice_maniac/utils/not.dart';

@singleton
class Database {
  late final DatabasePathProvider pathProvider;
  late final DatabaseAdapters adapters;

  Database();

  void init(DatabasePathProvider provider) {
    pathProvider = provider;
    Hive.init(pathProvider.path);

    adapters = DatabaseAdapters([
      BoxAdapter<Practice>(adapter: PracticeAdapter()),
      BoxAdapter<Exercise>(adapter: ExerciseAdapter()),
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
