import 'dart:math';

import 'package:flutter/material.dart';
import 'package:observable_ish/list/list.dart';
import 'package:practice_maniac/components/add_box.dart';
import 'package:practice_maniac/components/disclaimer.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/infra/mvvm/view_list.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view_model.dart';
import 'package:practice_maniac/utils/widget_selector.dart';

class PracticeListView extends ViewList<Practice, PracticeListViewModel> {
  RxList<Practice> get practices => viewModel.model;

  PracticeListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Practices',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Disclaimer(text: 'Welcome Back,'),
          WidgetSelector(
            selector: practices.isEmpty,
            onTrue: SimpleSelector(
              const Disclaimer(text: 'Create practices to tracker your progress'),
            ),
            onFalse: SimpleSelector(
              const Disclaimer(text: 'Those are your practices'),
            ),
          ),
          AddBox(
            onTap: viewModel.create,
          ),
        ],
      ),
    );
  }
}
