import 'dart:math';

import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/disclaimer.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_item/practice_item_view.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view_model.dart';
import 'package:practice_maniac/utils/visibility_selector.dart';
import 'package:rx_widgets/rx_widgets.dart';

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
          ReactiveBuilder(
            stream: practices.onChange,
            initialData: practices,
            builder: (context, _) => VisibilitySelector(
              selector: practices.isEmpty,
              onTrue: SimpleSelector(
                const Disclaimer(
                    text: 'Create practices to tracker your progress'),
              ),
              onFalse: SimpleSelector(
                const Disclaimer(text: 'Those are your practices'),
              ),
            ),
          ),
          AddBox(
            onTap: () {
              viewModel.create();
            },
          ),
          Expanded(
            child: ReactiveBuilder(
              stream: practices.onChange,
              initialData: practices,
              builder: (context, _) => CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _practices().toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _practices() {
    return practices.map(
      (practice) => PracticeItemView(
        key: Key(practice.id),
        practice: practice,
      ),
    );
  }
}
