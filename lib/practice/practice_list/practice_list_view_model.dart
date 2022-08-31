import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeListViewModel extends ViewModelList<Practice> {
  late final INavigator _navigator;

  late final RxCommand<void, void> create;

  PracticeListViewModel(this._navigator) {
    create = RxCommand.createSyncNoParamNoResult(_onCreate);
  }

  void _onCreate() {
    _navigator.go(PracticeRoutes().create);
  }
}
