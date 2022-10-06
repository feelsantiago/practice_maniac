import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/domain/progress.dart';

@injectable
class ProgressListViewModel extends ViewModelList<Progress> {
  final INavigator _navigator;

  ProgressListViewModel(this._navigator);
}
