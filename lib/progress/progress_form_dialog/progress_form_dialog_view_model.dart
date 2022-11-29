import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm/view_model_data.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/progress/domain/progress_form_model.dart';
import 'package:practice_maniac/utils/form/form_state_handler.dart';
import 'package:rx_command/rx_command.dart';

@injectable
class ProgressFormDialogViewModel extends ViewModelData<ProgressFormModel> {
  final FormStateHandler form;
  final INavigator _navigator;

  late final RxCommand<void, void> submit;

  ProgressFormModel get progress => model.value;

  ProgressFormDialogViewModel(this._navigator) : form = FormBuilder() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);

    commands([submit]);
  }

  @override
  dynamic onInit() {
    listeners.sink =
        form.saved().listen((_) => _navigator.pop(progress.model()));
  }

  void _onSubmit() {
    form.submit();
  }
}
