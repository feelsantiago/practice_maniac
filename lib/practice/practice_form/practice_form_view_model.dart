import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeFormViewModel extends ViewModelData<Practice> {
  final FormStateHandler form;
  final BlockColors colors;
  final Practices practices;

  late RxCommand<void, void> submit;
  late RxCommand<void, Practice> create;

  PracticeFormViewModel.inject(
    this.form,
    this.colors,
    this.practices,
  );

  PracticeFormViewModel(this.practices)
      : form = FormBuilder(),
        colors = const BlockColors() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);
    create = RxCommand.createFromStream((_) => practices.add(model.value));
  }

  @override
  dynamic onInit() {
    model.value.color = colors.all.first.value;
  }

  void _onSubmit() {
    if (form.validate()) {
      form.save();
      create();
    }
  }
}
