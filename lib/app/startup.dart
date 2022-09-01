import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/database/database.dart';
import 'package:practice_maniac/infra/database/database_path_provider.dart';
import 'package:practice_maniac/infra/router/navigation_observer.dart';
import 'package:practice_maniac/infra/router/navigator_stack.dart';

@singleton
class Startup {
  final Database _database;
  final NavigationStack _navigationStack;
  final DatabasePathProvider _path;

  Startup(
    this._database,
    this._navigationStack,
  ) : _path = DatabasePathProvider();

  Future<void> init(Navigation navigation) async {
    _navigationStack.listen(navigation);

    await _path.find();

    _database.init(_path);
    log('[Startup] - Database ready!');
  }
}
