import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/modal.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/progress_form_dialog/progress_form_dialog_view.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProgressListViewModel extends ViewModelList<Progress> {
  final INavigator _navigator;
  final Modal _modal;

  late final Progresses progresses;

  late final RxCommand<void, List<Progress>> fetch;
  late final RxCommand<void, void> create;

  ProgressListViewModel(this._navigator, this._modal) {
    fetch = RxCommand.createFromStream((_) => _onFetch());
    create = RxCommand.createFromStream((_) => _onCreate());

    commands([fetch]);
  }

  Stream<List<Progress>> _onFetch() {
    return progresses
        .all()
        .doOnData((progresses) => model.assignAll(progresses));
  }

  Stream<void> _onCreate() {
    return _modal
        .open<Progress>((context) =>
            ProgressFormDialogView(title: 'New', measure: progresses.measure))
        .onClose
        .where((progress) => progress.exist())
        .switchMap((progress) => progresses.add(progress.get()))
        .doOnData((_) => fetch());
  }
}
