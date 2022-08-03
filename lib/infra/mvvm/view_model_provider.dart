import 'package:practice_maniac/configuration/injection.dart';
import 'package:practice_maniac/infra/mvvm/view_model.dart';

class ViewModelProvider<T extends ViewModel> {
  T? _viewModel;
  T get viewModel {
    if (_viewModel != null) {
      return _viewModel!;
    }

    _viewModel = getIt<T>();
    return _viewModel!;
  }

  void setup(T viewModel) {
    _viewModel = viewModel;
  }
}
