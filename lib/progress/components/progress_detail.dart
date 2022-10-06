import 'package:flutter/material.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/utils/date_text.dart';

import 'progress_measure.dart';

class ProgressDetail extends StatelessWidget {
  final String measure;
  final Progress progress;

  const ProgressDetail({
    Key? key,
    required this.progress,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(DateText(progress.date()).extract()),
        ProgressMeasure(progress: progress, measure: measure),
      ],
    );
  }
}
