import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:rx_widgets/rx_widgets.dart';
import 'package:practice_maniac/packages/mvvm/view_list.dart';
import 'package:practice_maniac/tracker/tracker.dart';
import 'package:practice_maniac/tracker/tracker_item/tracker_item_view.dart';
import 'package:practice_maniac/tracker/tracker_list/tracker_list_view_model.dart';

class TrackerListView extends ViewList<Tracker, TrackerListViewModel> {
  RxList<Tracker> get trackers => viewModel.model;

  TrackerListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ReactiveBuilder(
            stream: trackers.onChange,
            initialData: trackers,
            builder: (context, _) => CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      _trackers(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: viewModel.newTrackerCommand,
        ),
      ],
    );
  }

  List<Widget> _trackers() {
    return trackers
        .map(
          (tracker) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TrackerItemView(
              key: Key(tracker.id),
              tracker: tracker,
            ),
          ),
        )
        .toList();
  }
}
