import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/form/form_state_handler.dart';
import 'package:rx_command/rx_command.dart';

import 'exercise_form_model.dart';

@injectable
class ExerciseFormViewModel extends ViewModelData<ExerciseFormModel> {
  final FormStateHandler form;
  final BlockColors colors;
  final INavigator _navigator;

  late final RxCommand<void, void> submit;

  ExerciseFormModel get exercise => model.value;

  ExerciseFormViewModel(this._navigator)
      : form = FormBuilder(),
        colors = const BlockColors() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);

    commands([submit]);
  }

  @override
  dynamic onInit() {
    listeners.sink =
        form.saved().listen((_) => _navigator.pop(exercise.model()));
  }

  void _onSubmit() {
    form.submit();
  }
}
