import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/exercise_routes.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PracticeItemViewModel extends ViewModelData<Practice> {
  final Practices _practices;
  final INavigator _navigator;

  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;
  late final RxCommand<void, void> detail;

  PracticeItemViewModel(this._practices, this._navigator) {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createFromStream((_) => _onEdit());
    detail = RxCommand.createSyncNoParamNoResult(_onDetail);

    commands([remove, edit, detail]);
  }

  void _onDetail() {
    ExerciseRoutes(_navigator).exercises(model.value);
  }

  Stream<void> _onRemove() {
    return _practices.remove(model.value);
  }

  Stream<void> _onEdit() {
    return PracticeRoutes(_navigator)
        .detail(model.value)
        .where((practice) => practice.exist())
        .doOnData((practice) => model.value.edit(practice.get()))
        .switchMap((_) => model.value.update());
  }
}
