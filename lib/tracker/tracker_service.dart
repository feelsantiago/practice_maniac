import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/tracker/tracker.dart';

@singleton
class TrackerService {
  Stream<List<Tracker>> find() {
    return Stream.value([
      Tracker(
        id: '1',
        name: 'Alternate Picking',
        measure: 'bpm',
        color: Colors.blue,
      ),
      Tracker(
        id: '2',
        name: 'Down Picking',
        measure: 'bpm',
        color: Colors.red,
      ),
      Tracker(
        id: '3',
        name: 'Two Hands',
        measure: 'bpm',
        color: Colors.green,
      ),
    ]);
  }
}
