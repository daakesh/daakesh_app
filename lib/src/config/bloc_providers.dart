import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/features.export.dart';

MultiBlocProvider listOfBloc({Widget? child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
      BlocProvider<MyOrderBloc>(create: (_) => MyOrderBloc()),
      BlocProvider<MyProductBloc>(create: (_) => MyProductBloc()),
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<SearchBloc>(create: (_) => SearchBloc()),
      BlocProvider<SectionsBloc>(create: (_) => SectionsBloc()),
      BlocProvider<BrandsBloc>(create: (_) => BrandsBloc()),
      BlocProvider<HandmadeBloc>(create: (_) => HandmadeBloc()),
      BlocProvider<TodayDealsBloc>(create: (_) => TodayDealsBloc()),
      BlocProvider<PassDataBloc>(create: (_) => PassDataBloc()),
      BlocProvider<AdvBloc>(create: (_) => AdvBloc()),
      ///BlocProvider<CommentBloc>(create: (_) => CommentBloc()),
      ///BlocProvider<RateBloc>(create: (_) => RateBloc()),
      BlocProvider<SwapBloc>(create: (_) => SwapBloc()),
      BlocProvider<SwapSearchBloc>(create: (_) => SwapSearchBloc()),
      BlocProvider<SwapSectionsBloc>(create: (_) => SwapSectionsBloc()),
      BlocProvider<TrendDealsBloc>(create: (_) => TrendDealsBloc()),
      BlocProvider<SwapPassDataBloc>(create: (_) => SwapPassDataBloc()),
      BlocProvider<SwapAdvBloc>(create: (_) => SwapAdvBloc()),
      ///BlocProvider<SwapCommentBloc>(create: (_) => CommentBloc()),
      ///BlocProvider<SwapRateBloc>(create: (_) => RateBloc()),

    ],
    child: child!,
  );
}

