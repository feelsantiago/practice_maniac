import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/progress_item/progress_item_view_model.dart';

class ProgressItemView extends ViewData<Progress, ProgressItemViewModel> {
  final String measure;

  Progress get progress => viewModel.model.value;

  ProgressItemView({
    Key? key,
    required Progress progress,
    required this.measure,
  }) : super(key: key, model: progress);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(progress.date().toString()),
        Text(progress.value),
        Text(measure),
      ],
    );
  }
}
