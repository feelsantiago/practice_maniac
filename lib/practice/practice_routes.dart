import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_view.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view.dart';

class PracticeRoutes implements RouteModule {
  final String practice = 'practice';
  final String create = 'practice-create';

  @override
  List<RxRoute> build() {
    return [
      RxRoute(
        path: practice,
        builder: (context, _) => PracticeListView(),
      ),
      RxRoute(
        path: create,
        builder: (context, _) => PracticeFormView(),
      ),
    ];
  }
}
