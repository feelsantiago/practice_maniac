import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/database.dart';
import 'package:practice_maniac/database/database_path_provider.dart';
import 'package:practice_maniac/infra/router/navigation_observer.dart';
import 'package:practice_maniac/infra/router/navigator_stack.dart';

@singleton
class Startup {
  final Database _database;
  final NavigationStack _navigationStack;

  Startup(
    this._database,
    this._navigationStack,
  );

  Future<void> init(Navigation navigation) async {
    _navigationStack.listen(navigation);

    final path = DatabasePathProvider();
    await path.find();

    _database.init(path);
    log('[Startup] - Database ready!');
  }
}
