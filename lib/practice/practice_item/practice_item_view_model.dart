import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeItemViewModel extends ViewModelData<Practice> {
  final Practices practices;
  final INavigator navigator;

  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;

  PracticeItemViewModel(this.practices, this.navigator) {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createSyncNoParamNoResult(_onEdit);
  }

  Stream<void> _onRemove() {
    return practices.remove(model.value);
  }

  void _onEdit() {
    navigator.go(PracticeRoutes().detail, arguments: model.value);
  }
}
