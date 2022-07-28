import 'package:flutter/material.dart';
import 'package:practice_maniac/packages/mvvm/view_data.dart';
import 'package:practice_maniac/tracker/tracker.dart';
import 'package:practice_maniac/tracker/tracker_item/components/last_progress.dart';
import 'package:practice_maniac/tracker/tracker_item/tracker_item_view_model.dart';

class TrackerItemView extends ViewData<Tracker, TrackerItemViewModel> {
  Tracker get tracker => viewModel.model.value;

  TrackerItemView({Key? key, required Tracker tracker}) : super(key: key, model: tracker);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: tracker.color,
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tracker.name),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Last Progress:'),
              LastProgress(
                progresses: tracker.progress,
                measure: tracker.measure,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
