import 'dart:ui';

import 'package:practice_maniac/progress/progress.dart';

class Tracker {
  final String id;
  final String name;
  final String measure;
  final Color color;
  final List<Progress> progress;

  Tracker({required this.id, required this.name, required this.measure, required this.color, List<Progress>? progress})
      : progress = progress ?? [];
}
