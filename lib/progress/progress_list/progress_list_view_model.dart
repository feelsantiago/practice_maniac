import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/progress.dart';

@injectable
class ProgressListViewModel extends ViewModelList<Progress> {}
