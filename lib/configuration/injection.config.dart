// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../database/database.dart' as _i3;
import '../database/repository.dart' as _i4;
import '../tracker/tracker_item/tracker_item_view_model.dart' as _i5;
import '../tracker/tracker_list/tracker_list_view_model.dart' as _i7;
import '../tracker/tracker_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Database>(_i3.Database());
  gh.factory<_i4.Repository>(() => _i4.Repository(get<_i3.Database>()));
  gh.factory<_i5.TrackerItemViewModel>(() => _i5.TrackerItemViewModel());
  gh.singleton<_i6.TrackerService>(_i6.TrackerService());
  gh.factory<_i7.TrackerListViewModel>(
      () => _i7.TrackerListViewModel(get<_i6.TrackerService>()));
  return get;
}
