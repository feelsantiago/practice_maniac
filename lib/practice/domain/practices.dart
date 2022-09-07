import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/utils/history.dart';
import 'package:rxdart/rxdart.dart';

import 'practice.dart';

@injectable
class Practices {
  final DataProvider provider;

  Practices(this.provider);

  Stream<Practice> add(Practice practice) {
    return provider.create(practice);
  }

  Stream<List<Practice>> all() {
    return provider
        .getAll<Practice>()
        .map((practices) => History(practices).descendent<Practice>())
        .doOnError((p0, p1) {
      print(p0);
    }).doOnData((practices) => print(practices.length));
  }

  Stream<void> clear() {
    return provider.clear<Practice>();
  }

  Stream<void> remove(Practice practice) {
    return provider.removeById<Practice>(practice.id);
  }
}
