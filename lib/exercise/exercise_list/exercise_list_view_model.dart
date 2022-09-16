import 'package:injectable/injectable.dart';
import 'package:practice_maniac/exercise/domain/exercise.dart';
import 'package:practice_maniac/infra/mvvm/view_model_list.dart';

@injectable
class ExerciseViewModel extends ViewModelList<Exercise> {}
