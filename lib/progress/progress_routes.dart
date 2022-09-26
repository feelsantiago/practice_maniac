import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view.dart';

class ProgressRoutes implements RouteModule {
  final String progress = 'progress';

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute(
        path: progress,
        builder: (context, _) => ProgressListView(),
      )
    ];
  }
}
