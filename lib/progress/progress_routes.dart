import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view.dart';

class ProgressRoutes implements RouteModule {
  late final INavigator _navigator;

  final String _progress = 'progress';

  ProgressRoutes(this._navigator);
  ProgressRoutes.routes();

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute<Progresses>(
        path: _progress,
        builder: (context, progresses) => ProgressListView(
          progresses: progresses.get(),
        ),
      )
    ];
  }

  Stream<void> progresses(
      Practice practice, String measure, List<Progress> progresses) {
    final arguments = Progresses.from(practice, measure, progresses);
    return _navigator.go(_progress, arguments: arguments);
  }
}
