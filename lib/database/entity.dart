import 'package:uuid/uuid.dart';

abstract class Entity {
  late String id;
  late DateTime createDate;

  Entity({String? id, DateTime? createDate})
      : id = id ?? Uuid().v4(),
        createDate = createDate ?? DateTime.now();
}
