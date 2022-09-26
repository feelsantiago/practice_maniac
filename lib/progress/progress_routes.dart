import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/progress/progress_list/progress_list_view.dart';

class ProgressRoutes implements RouteModule {
  late final INavigator _navigator;

  final String _progress = 'progress';

  ProgressRoutes(this._navigator);
  ProgressRoutes.routes();

  @override
  List<RxRoute<Object>> build() {
    return [
      RxRoute(
        path: _progress,
        builder: (context, _) => ProgressListView(),
      )
    ];
  }

  Stream<void> progress() {
    return _navigator.go(_progress);
  }
}
