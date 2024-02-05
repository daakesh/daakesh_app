// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daakesh/src/features/authentication/data/datasource/remote_auth_datasource.dart'
    as _i4;
import 'package:daakesh/src/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i5;
import 'package:daakesh/src/features/authentication/domain/use_cases/auth_use_cases.dart'
    as _i6;
import 'package:daakesh/src/features/home/data/datasource/remote_home_datasource.dart'
    as _i8;
import 'package:daakesh/src/features/home/data/repositories/home_repository_impl.dart'
    as _i9;
import 'package:daakesh/src/features/home/domain/use_cases/home_use_cases.dart'
    as _i10;
import 'package:daakesh/src/services/connectivity/connectivity_service.dart'
    as _i7;
import 'package:daakesh/src/services/network/network_service.dart' as _i11;
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
    gh.lazySingleton<_i6.AuthUseCases>(() => _i6.AuthUseCasesImpl(), registerFor: {_dev},);
    gh.singleton<_i7.ConnectivityService>(_i7.ConnectivityServiceImpl());
    gh.lazySingleton<_i3.HomeDatasource>(() => _i8.RemoteHomeDatasource());
    gh.lazySingleton<_i3.HomeRepository>(() => _i9.HomeRepositoryImpl());
    gh.lazySingleton<_i10.HomeUseCases>(
      () => _i10.HomeUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i11.NetworkService>(() => _i11.NetworkServiceImpl(enableLog: true));
    return this;
  }
}
