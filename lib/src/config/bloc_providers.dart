import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_bloc.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/features.export.dart';

MultiBlocProvider listOfBloc({Widget? child}) {
  return MultiBlocProvider(
    providers: [
      ///Auth Blocs
      BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      BlocProvider<ForgetPassBloc>(create: (_) => ForgetPassBloc()),
      BlocProvider<UserDataBloc>(create: (_) => UserDataBloc()),

      ///Profile Blocs
      BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
      BlocProvider<PersonalInfoBloc>(create: (_) => PersonalInfoBloc()),
      BlocProvider<ComplaintBloc>(create: (_) => ComplaintBloc()),
      BlocProvider<ContactInfoBloc>(create: (_) => ContactInfoBloc()),
      BlocProvider<NotificationsBloc>(create: (_) => NotificationsBloc()),

      ///My Order-Blocs
      BlocProvider<MyOrderBloc>(create: (_) => MyOrderBloc()),
      BlocProvider<SellOrderBloc>(create: (_) => SellOrderBloc()),
      BlocProvider<MySwapOrderBloc>(create: (_) => MySwapOrderBloc()),

      ///My Product-Blocs
      BlocProvider<MyProBloc>(create: (_) => MyProBloc()),
      BlocProvider<MySwapProBloc>(create: (_) => MySwapProBloc()),
      BlocProvider<ProDetailsBloc>(create: (_) => ProDetailsBloc()),
      BlocProvider<MyProFuncBloc>(create: (_) => MyProFuncBloc()),
      BlocProvider<AddProBloc>(create: (_) => AddProBloc()),
      BlocProvider<SellerInfoBloc>(create: (_) => SellerInfoBloc()),

      ///Home Blocs
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<SearchBloc>(create: (_) => SearchBloc()),
      BlocProvider<SectionsBloc>(create: (_) => SectionsBloc()),

      ///
      BlocProvider<BrandsBloc>(create: (_) => BrandsBloc()),
      BlocProvider<HandmadeBloc>(create: (_) => HandmadeBloc()),
      BlocProvider<AdvBloc>(create: (_) => AdvBloc()),
      BlocProvider<TodayDealsBloc>(create: (_) => TodayDealsBloc()),
      BlocProvider<OfferDealsBloc>(create: (_) => OfferDealsBloc()),

      ///
      BlocProvider<PassDataBloc>(create: (_) => PassDataBloc()),
      BlocProvider<ShippingBloc>(create: (_) => ShippingBloc()),
      BlocProvider<CartBloc>(create: (_) => CartBloc()),
      BlocProvider<FilterBloc>(create: (_) => FilterBloc()),
      BlocProvider<CommentBloc>(create: (_) => CommentBloc()),
      BlocProvider<RateBloc>(create: (_) => RateBloc()),

      ///Swap Blocs
      BlocProvider<SwapBloc>(create: (_) => SwapBloc()),
      BlocProvider<SwapSearchBloc>(create: (_) => SwapSearchBloc()),
      BlocProvider<SwapSectionsBloc>(create: (_) => SwapSectionsBloc()),
      BlocProvider<TrendDealsBloc>(create: (_) => TrendDealsBloc()),
      BlocProvider<SwapPassDataBloc>(create: (_) => SwapPassDataBloc()),
      BlocProvider<SwapAdvBloc>(create: (_) => SwapAdvBloc()),
      BlocProvider<SwapProBloc>(create: (_) => SwapProBloc()),
      BlocProvider<SwapFilterBloc>(create: (_) => SwapFilterBloc()),
      BlocProvider<FavouriteBloc>(
        create: (_) => FavouriteBloc(),
      ),

      ///BlocProvider<SwapCommentBloc>(create: (_) => CommentBloc()),
      ///BlocProvider<SwapRateBloc>(create: (_) => RateBloc()),
    ],
    child: child!,
  );
}
