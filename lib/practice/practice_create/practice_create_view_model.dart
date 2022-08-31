import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/utils/form.dart';

@injectable
class PracticeCreateViewModel extends ViewModelData<Practice> {
  final FormStateHandler form;

  PracticeCreateViewModel() : form = FormBuilder();
  PracticeCreateViewModel.inject(this.form);
}
