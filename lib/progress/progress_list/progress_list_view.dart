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

class ProgressListView extends ViewList<Progress, ProgressListViewModel> {
  final Progresses progresses;

  RxList<Progress> get progress => viewModel.model;

  ProgressListView({Key? key, required this.progresses})
      : super(key: key, model: []);

  @override
  dynamic onInit() {
    viewModel.progresses = progresses;
  }

  @override
  void onVisibilityGained() {
    viewModel.fetch();
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
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
    return progress.map(
      (progress) => ProgressItemView(
        progress: progress,
        progresses: progresses,
        onChange: viewModel.fetch,
      ),
    );
  }
}
