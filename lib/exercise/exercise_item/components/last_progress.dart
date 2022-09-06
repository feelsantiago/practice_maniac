import 'package:flutter/cupertino.dart';
import 'package:practice_maniac/progress/components/progress_detail.dart';
import 'package:practice_maniac/progress/progress.dart';
import 'package:collection/collection.dart';
import 'package:practice_maniac/utils/defined.dart';
import 'package:practice_maniac/components/visibility_selector.dart';

class LastProgress extends StatelessWidget {
  final List<Progress> progresses;
  final String measure;

  const LastProgress(
      {Key? key, required this.progresses, required this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = Defined(progresses.lastOrNull);
    return VisibilitySelector(
      selector: progress.exist(),
      onTrue: LazySelector(
        (_) => ProgressDetail(
          progress: progress.get(),
          measure: measure,
        ),
      ),
      onFalse: LazySelector((_) => _empty()),
    );
  }

  Widget _empty() {
    return const Text('No progress yet!');
  }
}
