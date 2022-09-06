import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';

import 'practice.dart';

@injectable
class Practices {
  final DataProvider provider;

  Practices(this.provider);

  Stream<Practice> add(Practice practice) {
    return provider.create(practice);
  }

  Stream<List<Practice>> all() {
    return provider.getAll<Practice>();
  }

  Stream<void> clear() {
    return provider.clear<Practice>();
  }
}
