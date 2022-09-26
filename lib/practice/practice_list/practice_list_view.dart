import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/disclaimer.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/components/reactive_list.dart';
import 'package:practice_maniac/components/rx_list_disclaimer.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_item/practice_item_view.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view_model.dart';

class PracticeListView extends ViewList<Practice, PracticeListViewModel> {
  RxList<Practice> get practices => viewModel.model;

  PracticeListView({Key? key}) : super(key: key, model: []);

  @override
  void onVisibilityGained() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Practices',
      leading: const Icon(Icons.menu),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Disclaimer(text: 'Welcome Back,'),
          RxListDisclaimer(
            items: practices,
            empty: 'Create practices to tracker your progress',
            full: 'Those are your practices',
          ),
          AddBox(
            onTap: () {
              viewModel.create();
            },
          ),
          ReactiveList(
            items: practices,
            onRefresh: viewModel.fetch,
            builder: (_) => _practices(),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _practices() {
    return practices.map(
      (practice) => PracticeItemView(
        practice: practice,
        onChange: viewModel.fetch,
      ),
    );
  }
}
