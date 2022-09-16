import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/exercise/domain/exercises.dart';
import 'package:practice_maniac/infra/database/data_provider.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ExerciseViewModel extends ViewModelList<Exercise> {
  late final Practice practice;

  late final Exercises _exercises;
  late final EmbeddedDataProvider _provider;

  late final RxCommand<void, List<Exercise>> fetch;

  ExerciseViewModel(this._provider) {
    fetch = RxCommand.createFromStream((_) => _onFetch());

    commands([fetch]);
  }

  @override
  dynamic onInit() {
    _exercises = Exercises.from(practice, _provider);
  }

  Stream<List<Exercise>> _onFetch() {
    return _exercises.all().doOnData((exercises) => model.assignAll(exercises));
  }
}
