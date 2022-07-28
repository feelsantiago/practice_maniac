import 'package:hive/hive.dart';

import 'entity.dart';

class BoxAdapter<T extends Entity> {
  final TypeAdapter<T> adapter;

  bool isOpen = false;

  String get name => T.toString();

  late final Box<T> _box;
  Box<T> get box {
    if (isOpen) {
      return _box;
    }

    throw Exception('Box not initialized');
  }

  BoxAdapter({required this.adapter});

  Future<void> open() async {
    _box = await Hive.openBox<T>(name);
    isOpen = true;
  }

  Future<void> close() async {
    _box.close();
  }
}
