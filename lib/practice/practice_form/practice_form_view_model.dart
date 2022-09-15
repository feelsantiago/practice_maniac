import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/practice/practice_form/practice_form_model.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class PracticeFormViewModel extends ViewModelData<PracticeFormModel> {
  final FormStateHandler form;
  final BlockColors colors;
  final Practices practices;
  final INavigator _navigator;

  late final RxCommand<void, void> submit;

  PracticeFormModel get practice => model.value;

  PracticeFormViewModel(this.practices, this._navigator)
      : form = FormBuilder(),
        colors = const BlockColors() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);

    commands([submit]);
  }

  @override
  dynamic onInit() {
    listeners.sink =
        form.saved().listen((_) => _navigator.pop(practice.value()));
  }

  void _onSubmit() {
    form.submit();
  }
}
