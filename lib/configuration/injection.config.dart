// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/practice_maniac_view_model.dart' as _i9;
import '../app/startup.dart' as _i6;
import '../database/database.dart' as _i3;
import '../database/repository.dart' as _i5;
import '../exercise/exercise_item/exercise_item_view_model.dart' as _i4;
import '../exercise/exercise_list/exercise_list_view_model.dart' as _i8;
import '../exercise/exercise_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Database>(_i3.Database());
  gh.factory<_i4.ExerciseItemViewModel>(() => _i4.ExerciseItemViewModel());
  gh.factory<_i5.Repository>(() => _i5.Repository(get<_i3.Database>()));
  gh.singleton<_i6.Startup>(_i6.Startup(get<_i3.Database>()));
  gh.singleton<_i7.ExerciseService>(_i7.ExerciseService(get<_i5.Repository>()));
  gh.factory<_i8.ExerciseViewModel>(
      () => _i8.ExerciseViewModel(get<_i7.ExerciseService>()));
  gh.factory<_i9.PracticeManiacViewModel>(
      () => _i9.PracticeManiacViewModel(get<_i6.Startup>()));
  return get;
}
