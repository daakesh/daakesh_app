import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class TrendDealsBloc extends Bloc<TrendDealsEvent, TrendDealsState> {
  TrendDealsBloc() : super(const TrendDealsState()) {
    on<GetTrendDealsDataEvent>(_getTodayDealsData);
  }

  static TrendDealsBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getTodayDealsData(
      GetTrendDealsDataEvent event, Emitter<TrendDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        swapTodayDealsStateStatus: SwapTodayDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        swapTodayDealsStateStatus: SwapTodayDealsStateStatus.LOADING,
        trendDealsListData: [],
        currentPage: 1,
      ));
    }

    final result =
        await getIt.get<SwapUseCases>().getTodayItemsData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(
          swapTodayDealsStateStatus: SwapTodayDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TrendDealsModel trendDealsModel = TrendDealsModel.fromJson(r.data);
      int lastPage = trendDealsModel.data!.lastPage!;
      List<TrendDealsItem> newResultList =
          trendDealsModel.data!.handmadeItemList!.toList();
      List<TrendDealsItem> trendDealListData =
          state.trendDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapTodayDealsStateStatus: SwapTodayDealsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      trendDealListData.addAll(newResultList);
      emit(state.copyWith(
        swapTodayDealsStateStatus: SwapTodayDealsStateStatus.SUCCESS,
        trendDealsListData: trendDealListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }
}
