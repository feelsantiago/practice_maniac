import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/modal.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:practice_maniac/progress/progress_form_dialog/progress_form_dialog_view.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProgressItemViewModel extends ViewModelData<Progress> {
  final Modal _modal;

  late final Progresses progresses;

  late final RxCommand<void, void> remove;
  late final RxCommand<void, void> edit;

  ProgressItemViewModel(this._modal) {
    remove = RxCommand.createFromStream((_) => _onRemove());
    edit = RxCommand.createFromStream((_) => _onEdit());
  }

  Stream<void> _onEdit() {
    return _modal
        .open<Progress>(
          (context) => ProgressFormDialogView(
            title: 'Edit',
            measure: progresses.measure,
            progress: model.value,
          ),
        )
        .onClose
        .where((progress) => progress.exist())
        .doOnData((progress) => model.value.edit(progress.get()))
        .switchMap((_) => progresses.update(model.value));
  }

  Stream<void> _onRemove() {
    return progresses.remove(model.value);
  }
}
