// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daakesh/src/services/network/network_service.dart' as _i4;
import 'package:daakesh/src/services/connectivity/connectivity_service.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:get_it/get_it.dart' as _i1;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ConnectivityService>(_i3.ConnectivityServiceImpl());
    gh.lazySingleton<_i4.NetworkService>(() => _i4.NetworkServiceImpl());
    return this;
  }
}
