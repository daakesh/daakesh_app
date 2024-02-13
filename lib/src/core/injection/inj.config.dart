// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daakesh/src/core/shared_preferences/shared_preferences.dart'
    as _i7;
import 'package:daakesh/src/features/authentication/data/datasource/remote_auth_datasource.dart'
    as _i4;
import 'package:daakesh/src/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i5;
import 'package:daakesh/src/features/authentication/domain/use_cases/auth_use_cases.dart'
    as _i6;
import 'package:daakesh/src/features/home/data/datasource/remote_home_datasource.dart'
    as _i9;
import 'package:daakesh/src/features/home/data/repositories/home_repository_impl.dart'
    as _i10;
import 'package:daakesh/src/features/home/domain/use_cases/home_use_cases.dart'
    as _i11;
import 'package:daakesh/src/services/connectivity/connectivity_service.dart'
    as _i8;
import 'package:daakesh/src/services/network/network_service.dart' as _i12;
import 'package:daakesh/src/services/user_service/user_data.dart' as _i13;
import 'package:daakesh/src/src.export.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';

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
    gh.lazySingleton<_i3.AuthDatasource>(() => _i4.RemoteAuthDatasource());
    gh.lazySingleton<_i3.AuthRepository>(() => _i5.AuthRepositoryImpl());
    gh.lazySingleton<_i6.AuthUseCases>(
      () => _i6.AuthUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i7.CacheHelper>(_i7.CacheHelperImpl());
    gh.singleton<_i8.ConnectivityService>(_i8.ConnectivityServiceImpl());
    gh.lazySingleton<_i3.HomeDatasource>(() => _i9.RemoteHomeDatasource());
    gh.lazySingleton<_i3.HomeRepository>(() => _i10.HomeRepositoryImpl());
    gh.lazySingleton<_i11.HomeUseCases>(
      () => _i11.HomeUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i12.NetworkService>(() => _i12.NetworkServiceImpl());
    gh.singleton<_i13.UserData>(_i13.UserDataImpl());
    return this;
  }
}
