import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rx_command/rx_command.dart';
import 'package:practice_maniac/packages/mvvm/view_model_list.dart';
import 'package:practice_maniac/tracker/tracker.dart';
import 'package:practice_maniac/tracker/tracker_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:practice_maniac/utils/colors_utils.dart';

@injectable
class TrackerListViewModel extends ViewModelList<Tracker> {
  final TrackerService _trackerService;

  late final RxCommand<void, void> newTrackerCommand;

  TrackerListViewModel(this._trackerService) {
    newTrackerCommand = RxCommand.createSyncNoParamNoResult(_onNewTrackerCommand);
  }

  @override
  dynamic onInit() {
    return _loadTrackers();
  }

  void _onNewTrackerCommand() {
    final colors = UniqueColorList(model.map((tracker) => tracker.color));
    final color = ColorPallet().unique(colors);
    final id = int.parse(model.last.id) + 1;
    final tracker = Tracker(id: id.toString(), name: 'New Progress', measure: 'bmp', color: color);

    model.add(tracker);
  }

  Stream<List<Tracker>> _loadTrackers() {
    return _trackerService.find().doOnData((trackers) {
      model.assignAll(trackers);
    });
  }
}
