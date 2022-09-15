import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/practice/practice_routes.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PracticeItemViewModel extends ViewModelData<Practice> {
  final Practices practices;
  final INavigator navigator;

  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;

  PracticeItemViewModel(this.practices, this.navigator) {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createFromStream((_) => _onEdit());

    commands([remove, edit]);
  }

  Stream<void> _onRemove() {
    return practices.remove(model.value);
  }

  Stream<void> _onEdit() {
    return navigator
        .go<Practice>(
          PracticeRoutes().detail,
          arguments: model.value,
        )
        .where((practice) => practice.exist())
        .doOnData((practice) => model.value.edit(practice.get()))
        .switchMap((_) => model.value.update());
  }
}
