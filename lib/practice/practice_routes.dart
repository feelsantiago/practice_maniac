import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/infra/router/rx_route.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_view.dart';
import 'package:practice_maniac/practice/practice_list/practice_list_view.dart';

import '../utils/defined.dart';

class PracticeRoutes implements RouteModule {
  late final INavigator _navigator;

  final String _practices = 'practices';
  final String _create = 'practice-create';
  final String _detail = 'practice-detail';

  PracticeRoutes(this._navigator);
  PracticeRoutes.routes();

  @override
  List<RxRoute> build() {
    return [
      RxRoute(
        path: _practices,
        builder: (context, _) => PracticeListView(),
      ),
      RxRoute<Practice>(
        path: _create,
        builder: (context, _) => PracticeFormView(),
      ),
      RxRoute<Practice>(
        path: _detail,
        builder: (context, practice) => PracticeFormView(
          practice: practice.get(),
        ),
      )
    ];
  }

  String entry() {
    return _practices;
  }

  Stream<void> practices() {
    return _navigator.go(_practices);
  }

  Stream<Defined<Practice>> create() {
    return _navigator.go<Practice>(_create);
  }

  Stream<Defined<Practice>> detail(Practice practice) {
    return _navigator.go<Practice>(_detail, arguments: practice);
  }
}
