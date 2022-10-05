import 'package:flutter/cupertino.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

class ProgressDetail extends StatelessWidget {
  final Progress progress;
  final String measure;

  const ProgressDetail({
    Key? key,
    required this.progress,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: progress.value, children: [
        TextSpan(text: measure),
      ]),
    );
  }
}
