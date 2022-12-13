import 'package:flutter/material.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/reactive_list.dart';
import 'package:practice_maniac/components/rx_list_disclaimer.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:practice_maniac/progress/progress_item/progress_item_view.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view_model.dart';
import 'package:practice_maniac/utils/fit_strategy.dart';

class ProgressListView extends ViewList<Progress, ProgressListViewModel> {
  final Progresses progresses;

  RxList<Progress> get progress => viewModel.model;

  ProgressListView({Key? key, required this.progresses})
      : super(key: key, model: progresses.allSync());

  @override
  dynamic onInit() {
    viewModel.progresses = progresses;
  }

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: '${progresses.exercise} Progress',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RxListDisclaimer(
            items: progress,
            empty: 'No progress yet...',
            full: 'There are your progress',
          ),
          AddBox(onTap: viewModel.create),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: ReactiveList(
                fit: const FitOnly(),
                items: progress,
                onRefresh: () => viewModel.fetch(),
                initialData: progress,
                builder: (_) => _progress(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _progress() {
    return progress.map(
      (progress) => ProgressItemView(
        key: Key(progress.id),
        progress: progress,
        progresses: progresses,
        onChange: viewModel.fetch,
      ),
    );
  }
}
