import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

@injectable
class ProgressListViewModel extends ViewModelList<Progress> {}
