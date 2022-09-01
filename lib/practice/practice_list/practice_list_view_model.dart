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
    create = RxCommand.createSyncNoParamNoResult(_onCreate);
    fetch = RxCommand.createFromStream(_fetch);
  }

  void _onCreate() {
    _navigator.go(PracticeRoutes().create);
  }

  Stream<List<Practice>> _fetch(void param) {
    return practices.fetch().doOnData((data) => model.assignAll(data));
  }
}
