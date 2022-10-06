import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class ProgressItemViewModel extends ViewModelData<Progress> {
  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;

  ProgressItemViewModel() {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createFromStream((_) => _onEdit());
  }

  Stream<void> _onEdit() async* {}

  Stream<void> _onRemove() async* {}
}
