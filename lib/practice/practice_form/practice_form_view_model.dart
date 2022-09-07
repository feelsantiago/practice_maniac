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

  late final bool edit;
  Practice practice = Practice.empty();

  late final RxCommand<void, void> submit;
  late final RxCommand<void, void> create;
  late final RxCommand<void, void> update;

  final ListenersSink _listeners = ListenersSink();

  PracticeFormViewModel(this.practices, this._navigator)
      : form = FormBuilder(),
        colors = const BlockColors() {
    submit = RxCommand.createSyncNoParamNoResult(_onSubmit);
    create = RxCommand.createFromStream(
      (_) => _onCreate(),
      restriction: form.status(),
    );
    update = RxCommand.createFromStream(
      (_) => _onUpdate(),
      restriction: form.status(),
    );
  }

  @override
  dynamic onInit() {
    int base = colors.all.first.value;

    practice = practice.copyWith(
      name: model.value.name,
      color: edit ? model.value.color : base,
    );

    _listeners.sink = form.saved().listen((_) => edit ? update() : create());
    _listeners.sink = MergeStream([
      create.results,
      update.results,
    ]).listen((value) {
      _navigator.pop();
    });
  }

  @override
  void onDispose() {
    _listeners.cancel();
  }

  void _onSubmit() {
    form.submit();
    model.value.edit(practice);
  }

  Stream<Practice> _onCreate() {
    return practices.add(model.value);
  }

  Stream<Practice> _onUpdate() {
    return model.value.update();
  }
}
