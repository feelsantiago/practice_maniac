import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/list_to_map.dart';

import 'box_adapter.dart';
import 'entity.dart';

class DatabaseAdapters {
  late final Map<String, BoxAdapter> boxes;
  late final ListToMap<String, BoxAdapter, BoxAdapter> listTransform;

  DatabaseAdapters(List<BoxAdapter> boxes) {
    listTransform = ListToMap<String, BoxAdapter, BoxAdapter>(
      boxes,
      (box) => MapEntry(key: box.name, value: box),
    );
  }

  BoxAdapter<E> get<E extends Entity>() {
    final box = Defined(boxes[E.toString()]);

    if (box.not.exist()) {
      throw Exception('Invalid Box');
    }

    return box.get() as BoxAdapter<E>;
  }

  void register() {
    boxes = listTransform.transform();

    for (var box in boxes.values) {
      box.register();
    }
  }
}
