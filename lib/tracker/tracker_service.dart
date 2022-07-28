import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practice_maniac/database/repository.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/tracker/tracker.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class TrackerService {
  final Repository _repository;

  TrackerService(this._repository);

  Stream<List<Tracker>> find() {
    return Stream.fromFuture(_repository.getAll<Practice>())
        .doOnData((event) => print(event))
        .map((practice) => practice.first.trackers);
  }
}
