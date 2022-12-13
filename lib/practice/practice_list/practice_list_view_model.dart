import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PracticeListViewModel extends ViewModelList<Practice> {
  late final INavigator _navigator;

  Practices practices;

  late final RxCommand<void, void> create;
  late final RxCommand<void, List<Practice>> fetch;

  PracticeListViewModel(this.practices, this._navigator) {
    create = RxCommand.createFromStream((_) => _onCreate());
    fetch = RxCommand.createFromStream((_) => _onFetch());

    commands([create, fetch]);
  }

  Stream<void> _onCreate() {
    return PracticeRoutes(_navigator)
        .create()
        .where((practice) => practice.exist())
        .switchMap((practice) => practices.add(practice.get()))
        .doOnData((practice) => model.add(practice));
  }

  Stream<List<Practice>> _onFetch() {
    return practices.all().doOnData((data) => model.assignAll(data));
  }
}
