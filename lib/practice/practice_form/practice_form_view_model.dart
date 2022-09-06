import 'package:injectable/injectable.dart';
import 'package:practice_maniac/infra/mvvm.dart';
import 'package:practice_maniac/infra/router/navigator.dart';
import 'package:practice_maniac/practice/domain/practice.dart';
import 'package:practice_maniac/practice/domain/practices.dart';
import 'package:practice_maniac/utils/colors_utils.dart';
import 'package:practice_maniac/utils/form.dart';
import 'package:practice_maniac/utils/listeners_sink.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PracticeFormViewModel extends ViewModelData<Practice> {
  final FormStateHandler form;
  final BlockColors colors;
  final Practices practices;
  final INavigator _navigator;

  late final RxCommand<void, void> submit;
  late final RxCommand<void, void> create;

  final ListenersSink _listeners = ListenersSink();

  PracticeFormViewModel(this.practices, this._navigator)
      : form = FormBuilder(),
        colors = const BlockColors() {
    submit = RxCommand.createSyncNoParamNoResult(form.submit);
    create = RxCommand.createFromStream(
      (_) => _onCreate(),
      restriction: form.status(),
    );
  }

  @override
  dynamic onInit() {
    model.value.color = colors.all.first.value;
    _listeners.sink = form.saved().listen((_) => create());
  }

  @override
  void onDispose() {
    _listeners.cancel();
  }

  Stream<Practice> _onCreate() {
    return practices.add(model.value).doOnData((_) => _navigator.pop());
  }
}
