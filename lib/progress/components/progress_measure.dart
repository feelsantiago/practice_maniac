import 'package:flutter/cupertino.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

class ProgressMeasure extends StatelessWidget {
  final Progress progress;
  final String measure;

  const ProgressMeasure({
    Key? key,
    required this.progress,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: progress.value.toString(),
        children: [
          const WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(width: 5),
          ),
          TextSpan(text: measure),
        ],
      ),
    );
  }
}
