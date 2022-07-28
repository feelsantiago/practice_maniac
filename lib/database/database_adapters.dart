import 'package:hive/hive.dart';
import 'package:practice_maniac/database/box_adapter.dart';
import 'package:practice_maniac/database/entity.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/utils/list_to_map.dart';

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

    if (box.empty()) {
      throw Exception('Invalid Box');
    }

    return box.get() as BoxAdapter<E>;
  }

  void register() {
    boxes = listTransform.transform();

    for (var box in boxes.values) {
      Hive.registerAdapter(box.adapter);
    }
  }
}
