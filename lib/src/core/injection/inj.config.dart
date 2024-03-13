// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daakesh/src/core/shared_preferences/secure_shared_pref.dart'
    as _i23;
import 'package:daakesh/src/core/shared_preferences/shared_preferences.dart'
    as _i7;
import 'package:daakesh/src/features/authentication/data/datasource/remote_auth_datasource.dart'
    as _i4;
import 'package:daakesh/src/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i5;
import 'package:daakesh/src/features/authentication/domain/use_cases/auth_use_cases.dart'
    as _i6;
import 'package:daakesh/src/features/home/data/datasource/remote_home_datasource.dart'
    as _i10;
import 'package:daakesh/src/features/home/data/repositories/home_repository_impl.dart'
    as _i11;
import 'package:daakesh/src/features/home/domain/use_cases/home_use_cases.dart'
    as _i12;
import 'package:daakesh/src/features/my_order/data/datasource/remote_my_order_datasource.dart'
    as _i13;
import 'package:daakesh/src/features/my_order/data/repositories/my_order_repository_impl.dart'
    as _i14;
import 'package:daakesh/src/features/my_order/domain/use_cases/my_order_use_cases.dart'
    as _i15;
import 'package:daakesh/src/features/my_product/data/datasource/remote_my_product_datasource.dart'
    as _i16;
import 'package:daakesh/src/features/my_product/data/repositories/my_product_repository_impl.dart'
    as _i17;
import 'package:daakesh/src/features/my_product/domain/use_cases/my_product_use_cases.dart'
    as _i18;
import 'package:daakesh/src/features/profile/data/datasource/remote_profile_datasource.dart'
    as _i20;
import 'package:daakesh/src/features/profile/data/repositories/profile_repository_impl.dart'
    as _i21;
import 'package:daakesh/src/features/profile/domain/use_cases/profile_use_cases.dart'
    as _i22;
import 'package:daakesh/src/features/swap/data/datasource/remote_swap_datasource.dart'
    as _i24;
import 'package:daakesh/src/features/swap/data/repositories/swap_repository_impl.dart'
    as _i25;
import 'package:daakesh/src/features/swap/domain/use_cases/swap_use_cases.dart'
    as _i26;
import 'package:daakesh/src/services/connectivity/connectivity_service.dart'
    as _i8;
import 'package:daakesh/src/services/network/network_service.dart' as _i19;
import 'package:daakesh/src/services/user_service/edit_product.dart' as _i9;
import 'package:daakesh/src/services/user_service/user_data.dart' as _i27;
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
    gh.singleton<_i9.EditProduct>(_i9.EditProductImpl());
    gh.lazySingleton<_i3.HomeDatasource>(() => _i10.RemoteHomeDatasource());
    gh.lazySingleton<_i3.HomeRepository>(() => _i11.HomeRepositoryImpl());
    gh.lazySingleton<_i12.HomeUseCases>(
      () => _i12.HomeUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.MyOrderDatasource>(
        () => _i13.RemoteMyOrderDatasource());
    gh.lazySingleton<_i3.MyOrderRepository>(() => _i14.MyOrderRepositoryImpl());
    gh.lazySingleton<_i15.MyOrderUseCases>(
      () => _i15.MyOrderUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.MyProductDatasource>(
        () => _i16.RemoteMyProductDatasource());
    gh.lazySingleton<_i3.MyProductRepository>(
        () => _i17.MyProductRepositoryImpl());
    gh.lazySingleton<_i18.MyProductUseCases>(
      () => _i18.MyProductUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i19.NetworkService>(() => _i19.NetworkServiceImpl());
    gh.lazySingleton<_i3.ProfileDatasource>(
        () => _i20.RemoteProfileDatasource());
    gh.lazySingleton<_i3.ProfileRepository>(() => _i21.ProfileRepositoryImpl());
    gh.lazySingleton<_i22.ProfileUseCases>(
      () => _i22.ProfileUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i23.SecureSharedPref>(_i23.ImplSecureSharedPref());
    gh.lazySingleton<_i3.SwapDatasource>(() => _i24.RemoteSwapDatasource());
    gh.lazySingleton<_i3.SwapRepository>(() => _i25.SwapRepositoryImpl());
    gh.lazySingleton<_i26.SwapUseCases>(
      () => _i26.SwapUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i27.UserData>(_i27.UserDataImpl());
    return this;
  }
}
