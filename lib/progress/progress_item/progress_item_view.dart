import 'package:flutter/material.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/components/progress_detail.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/progress_item/progress_item_view_model.dart';
import 'package:practice_maniac/utils/date_text.dart';

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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: Divider(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(DateText(progress.date()).extract()),
            ProgressDetail(progress: progress, measure: measure),
          ],
        ),
      ],
    );
  }
}
