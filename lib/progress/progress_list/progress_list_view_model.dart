import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/domain/progress.dart';
import 'package:practice_maniac/progress/domain/progresses.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProgressListViewModel extends ViewModelList<Progress> {
  final INavigator _navigator;

  late final Progresses progresses;

  late final RxCommand<void, List<Progress>> fetch;

  ProgressListViewModel(this._navigator) {
    fetch = RxCommand.createFromStream((_) => _onFetch());

    commands([fetch]);
  }

  Stream<List<Progress>> _onFetch() {
    return progresses
        .all()
        .doOnData((progresses) => model.assignAll(progresses));
  }
}
