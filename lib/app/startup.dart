import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/database.dart';
import 'package:practice_maniac/database/database_path_provider.dart';

@singleton
class Startup {
  final Database _database;

  Startup(this._database);

  Future<void> init() async {
    final path = DatabasePathProvider();
    await path.find();

    _database.init(path);
  }
}
