import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/tracker/tracker.dart';

@singleton
class TrackerService {
  Stream<List<Tracker>> find() {
    return Stream.value([
      Tracker(
        name: 'Alternate Picking',
        measure: 'bpm',
        color: Colors.blue,
      ),
      Tracker(
        name: 'Down Picking',
        measure: 'bpm',
        color: Colors.red,
      ),
      Tracker(
        name: 'Two Hands',
        measure: 'bpm',
        color: Colors.green,
      ),
    ]);
  }
}
