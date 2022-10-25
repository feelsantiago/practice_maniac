import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/modal.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/components/progress_info_dialog.dart';
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
  late final RxCommand<void, bool> create;

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

  Stream<bool> _onCreate() {
    return _modal
        .open<bool>((context) =>
            ProgressInfoDialog(title: 'Novo', measure: progresses.measure))
        .onClose
        .map((event) => true);
  }
}
