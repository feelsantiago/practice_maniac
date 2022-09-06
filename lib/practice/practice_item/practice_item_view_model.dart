import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeItemViewModel extends ViewModelData<Practice> {
  final Practices practices;

  late final RxCommand<void, void> remove;

  PracticeItemViewModel(this.practices) {
    remove = RxCommand.createFromStream((_) => _onRemove());
  }

  Stream<void> _onRemove() {
    return practices.remove(model.value);
  }
}
