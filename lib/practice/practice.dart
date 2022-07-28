import 'dart:ui';

import 'package:practice_maniac/tracker/tracker.dart';

class Practice {
  String name;
  Color color;
  List<Tracker> trackers;

  Practice({required this.name, required this.color, List<Tracker>? trackers}) : trackers = trackers ?? [];
}
