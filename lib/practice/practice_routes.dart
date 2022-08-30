import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view.dart';

class PracticeRoutes implements RouteModule {
  final String practice = 'practice';

  @override
  List<RxRoute> build() {
    return [
      RxRoute(
        path: practice,
        builder: (context, _) => PracticeListView(),
      ),
    ];
  }
}
