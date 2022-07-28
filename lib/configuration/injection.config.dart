// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/practice_maniac_view_model.dart' as _i8;
import '../app/startup.dart' as _i5;
import '../database/database.dart' as _i3;
import '../database/repository.dart' as _i4;
import '../tracker/tracker_item/tracker_item_view_model.dart' as _i6;
import '../tracker/tracker_list/tracker_list_view_model.dart' as _i9;
import '../tracker/tracker_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Database>(_i3.Database());
  gh.factory<_i4.Repository>(() => _i4.Repository(get<_i3.Database>()));
  gh.singleton<_i5.Startup>(_i5.Startup(get<_i3.Database>()));
  gh.factory<_i6.TrackerItemViewModel>(() => _i6.TrackerItemViewModel());
  gh.singleton<_i7.TrackerService>(_i7.TrackerService());
  gh.factory<_i8.PracticeManiacViewModel>(
      () => _i8.PracticeManiacViewModel(get<_i5.Startup>()));
  gh.factory<_i9.TrackerListViewModel>(
      () => _i9.TrackerListViewModel(get<_i7.TrackerService>()));
  return get;
}
