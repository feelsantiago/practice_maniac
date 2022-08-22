import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeListViewModel extends ViewModelList<Practice> {
  late final RxCommand<void, void> create;

  PracticeListViewModel() {
    create = RxCommand.createSyncNoParamNoResult(_onCreate);
  }

  void _onCreate() {
    print('test');
  }
}
