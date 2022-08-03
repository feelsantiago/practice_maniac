import 'package:injectable/injectable.dart';
import 'package:practice_maniac/app/startup.dart';
import 'package:practice_maniac/infra/mvvm/view_model.dart';

@injectable
class PracticeManiacViewModel extends ViewModel {
  final Startup _startup;

  PracticeManiacViewModel(this._startup);

  @override
  dynamic onInit() async {
    await _startup.init();
  }
}
