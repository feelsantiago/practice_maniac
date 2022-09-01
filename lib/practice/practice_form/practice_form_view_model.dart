import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/practice.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeFormViewModel extends ViewModelData<Practice> {
  final FormStateHandler form;
  final BlockColors colors;

  late RxCommand<void, void> submit;

  PracticeFormViewModel.inject(this.form, this.colors);
  PracticeFormViewModel({this.colors = const BlockColors()})
      : form = FormBuilder() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);
  }

  @override
  dynamic onInit() {
    model.value.color = colors.all.first.value;
  }

  void _onSubmit() {
    if (form.validate()) {
      form.save();
    }
  }
}
