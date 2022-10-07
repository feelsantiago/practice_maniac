import 'package:flutter/material.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/reactive_list.dart';
import 'package:practice_maniac/components/rx_list_disclaimer.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/components/last_progress.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/progress_item/progress_item_view.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view_model.dart';

class ProgressListView extends ViewList<Progress, ProgressListViewModel> {
  RxList<Progress> get progress => viewModel.model;

  ProgressListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Progress',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RxListDisclaimer(
            items: progress,
            empty: 'No progress yet...',
            full: 'There are your progress',
          ),
          AddBox(onTap: () {}),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  LastProgress(
                    progress: Progress(value: "1", createdAt: DateTime.now()),
                    measure: 'bpm',
                  ),
                  const Center(child: Text('History')),
                  const SizedBox(height: 20),
                  ReactiveList(
                    items: progress,
                    builder: (_) => _progress(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _progress() {
    return List.generate(
      25,
      (index) => Progress(
        value: index.toString(),
        createdAt: DateTime.now(),
      ),
    ).map(
      (progress) => ProgressItemView(progress: progress, measure: 'bpm'),
    );
  }
}
