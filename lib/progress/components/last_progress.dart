import 'package:flutter/material.dart';
import 'package:practice_maniac/progress/components/progress_detail.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

class LastProgress extends StatelessWidget {
  final String measure;
  final Progress progress;

  const LastProgress({
    Key? key,
    required this.progress,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProgressDetail(progress: progress, measure: measure);
  }
}
