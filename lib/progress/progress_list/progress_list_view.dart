import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_maniac/components/page_structure.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/progress.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view_model.dart';

class ProgressListView extends ViewList<Progress, ProgressListViewModel> {
  ProgressListView({Key? key}) : super(key: key, model: []);

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Progress',
      body: Container(
        child: const Text('Progress'),
      ),
    );
  }
}
