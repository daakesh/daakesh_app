// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daakesh/src/core/shared_preferences/secure_shared_pref.dart'
    as _i188;
import 'package:daakesh/src/core/shared_preferences/shared_preferences.dart'
    as _i853;
import 'package:daakesh/src/features/authentication/data/datasource/remote_auth_datasource.dart'
    as _i933;
import 'package:daakesh/src/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i492;
import 'package:daakesh/src/features/authentication/domain/use_cases/auth_use_cases.dart'
    as _i119;
import 'package:daakesh/src/features/favourite/data/datasourse/favourite_datasource.dart'
    as _i62;
import 'package:daakesh/src/features/favourite/data/datasourse/remote_favourite_datasource.dart'
    as _i760;
import 'package:daakesh/src/features/favourite/data/repositories/favourite_repository_impl.dart'
    as _i277;
import 'package:daakesh/src/features/favourite/domin/repositories/favourite_repository.dart'
    as _i51;
import 'package:daakesh/src/features/favourite/domin/usecases/favourite_usecases.dart'
    as _i934;
import 'package:daakesh/src/features/home/data/datasource/remote_home_datasource.dart'
    as _i279;
import 'package:daakesh/src/features/home/data/repositories/home_repository_impl.dart'
    as _i1054;
import 'package:daakesh/src/features/home/domain/use_cases/home_use_cases.dart'
    as _i561;
import 'package:daakesh/src/features/my_order/data/datasource/remote_my_order_datasource.dart'
    as _i354;
import 'package:daakesh/src/features/my_order/data/repositories/my_order_repository_impl.dart'
    as _i597;
import 'package:daakesh/src/features/my_order/domain/use_cases/my_order_use_cases.dart'
    as _i1067;
import 'package:daakesh/src/features/my_product/data/datasource/remote_my_product_datasource.dart'
    as _i9;
import 'package:daakesh/src/features/my_product/data/repositories/my_product_repository_impl.dart'
    as _i717;
import 'package:daakesh/src/features/my_product/domain/use_cases/my_product_use_cases.dart'
    as _i895;
import 'package:daakesh/src/features/profile/data/datasource/remote_notifications_datasource.dart'
    as _i425;
import 'package:daakesh/src/features/profile/data/datasource/remote_profile_datasource.dart'
    as _i365;
import 'package:daakesh/src/features/profile/data/repositories/notifications_repository_impl.dart'
    as _i584;
import 'package:daakesh/src/features/profile/data/repositories/profile_repository_impl.dart'
    as _i865;
import 'package:daakesh/src/features/profile/domain/use_cases/notifications_use_cases.dart'
    as _i351;
import 'package:daakesh/src/features/profile/domain/use_cases/profile_use_cases.dart'
    as _i471;
import 'package:daakesh/src/features/swap/data/datasource/remote_swap_datasource.dart'
    as _i526;
import 'package:daakesh/src/features/swap/data/repositories/swap_repository_impl.dart'
    as _i416;
import 'package:daakesh/src/features/swap/domain/use_cases/swap_use_cases.dart'
    as _i549;
import 'package:daakesh/src/services/connectivity/connectivity_service.dart'
    as _i971;
import 'package:daakesh/src/services/network/network_service.dart' as _i716;
import 'package:daakesh/src/services/user_service/contact_info.dart' as _i1018;
import 'package:daakesh/src/services/user_service/edit_product.dart' as _i803;
import 'package:daakesh/src/services/user_service/user_data.dart' as _i198;
import 'package:daakesh/src/src.export.dart' as _i467;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i198.UserData>(() => _i198.UserDataImpl());
    gh.lazySingleton<_i467.MyProductDatasource>(
        () => _i9.RemoteMyProductDatasource());
    gh.lazySingleton<_i467.HomeDatasource>(() => _i279.RemoteHomeDatasource());
    gh.singleton<_i853.CacheHelper>(() => _i853.CacheHelperImpl());
    gh.lazySingleton<_i62.FavouriteDataSource>(
        () => _i760.RemoteFavouriteDataSource());
    gh.lazySingleton<_i51.FavouriteRepository>(
        () => _i277.FavouriteRepositoryImpl());
    gh.singleton<_i971.ConnectivityService>(
        () => _i971.ConnectivityServiceImpl());
    gh.lazySingleton<_i467.MyOrderDatasource>(
        () => _i354.RemoteMyOrderDatasource());
    gh.lazySingleton<_i351.NotificationsUseCases>(
        () => _i351.NotificationsUseCasesImpl());
    gh.lazySingleton<_i467.SwapRepository>(() => _i416.SwapRepositoryImpl());
    gh.lazySingleton<_i467.HomeRepository>(() => _i1054.HomeRepositoryImpl());
    gh.lazySingleton<_i467.AuthDatasource>(() => _i933.RemoteAuthDatasource());
    gh.lazySingleton<_i561.HomeUseCases>(
      () => _i561.HomeUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i934.FavouriteUseCases>(
      () => _i934.FavouriteUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i467.SwapDatasource>(() => _i526.RemoteSwapDatasource());
    gh.lazySingleton<_i549.SwapUseCases>(
      () => _i549.SwapUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i716.NetworkService>(() => _i716.NetworkServiceImpl());
    gh.lazySingleton<_i471.ProfileUseCases>(
      () => _i471.ProfileUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i467.MyProductRepository>(
        () => _i717.MyProductRepositoryImpl());
    gh.singleton<_i1018.ContactInfoService>(() => _i1018.ContactInfoImpl());
    gh.lazySingleton<_i467.AuthRepository>(() => _i492.AuthRepositoryImpl());
    gh.singleton<_i188.SecureSharedPref>(() => _i188.ImplSecureSharedPref());
    gh.lazySingleton<_i1067.MyOrderUseCases>(
      () => _i1067.MyOrderUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i467.ProfileDatasource>(
        () => _i365.RemoteProfileDatasource());
    gh.lazySingleton<_i467.MyOrderRepository>(
        () => _i597.MyOrderRepositoryImpl());
    gh.lazySingleton<_i119.AuthUseCases>(
      () => _i119.AuthUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i467.NotificationsDatasource>(
        () => _i425.RemoteNotificationsDatasource());
    gh.lazySingleton<_i467.ProfileRepository>(
        () => _i865.ProfileRepositoryImpl());
    gh.singleton<_i803.EditProduct>(() => _i803.EditProductImpl());
    gh.lazySingleton<_i467.NotificationsRepository>(
        () => _i584.NotificationsRepositoryImpl());
    gh.lazySingleton<_i895.MyProductUseCases>(
      () => _i895.MyProductUseCasesImpl(),
      registerFor: {_dev},
    );
    return this;
  }
}
