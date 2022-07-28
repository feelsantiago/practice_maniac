// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../tracker/tracker_item/tracker_item_view_model.dart' as _i3;
import '../tracker/tracker_list/tracker_list_view_model.dart' as _i5;
import '../tracker/tracker_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.TrackerItemViewModel>(() => _i3.TrackerItemViewModel());
  gh.singleton<_i4.TrackerService>(_i4.TrackerService());
  gh.factory<_i5.TrackerListViewModel>(
      () => _i5.TrackerListViewModel(get<_i4.TrackerService>()));
  return get;
}
