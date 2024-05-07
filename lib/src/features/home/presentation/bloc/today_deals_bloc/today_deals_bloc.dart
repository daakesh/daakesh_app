import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class TodayDealsBloc extends Bloc<TodayDealsEvent, TodayDealsState> {
  TodayDealsBloc() : super(const TodayDealsState()) {
    on<GetToadyDealsDataEvent>(_getTodayDealsData);
    on<GetToadyDaakeshDealsDataEvent>(_getToadyDaakeshDealsData);
  }

  static TodayDealsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getTodayDealsData(
      GetToadyDealsDataEvent event, Emitter<TodayDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        todayDealsStateStatus: TodayDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.LOADING,
        todayDealsListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt
        .get<HomeUseCases>()
        .getTodayItemsData(HomeTodayItemType.Sell, state.currentPage);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      int lastPage = todayItemModel.data!.lastPage!;
      List<TodayItem> newResultList =
          todayItemModel.data!.todayItemList!.toList();
      List<TodayItem> todayDealsListData = state.todayDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      todayDealsListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        todayDealsListData: todayDealsListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _getToadyDaakeshDealsData(GetToadyDaakeshDealsDataEvent event,
      Emitter<TodayDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        daakeshCurrentPage: state.daakeshCurrentPage + 1,
        todayDealsStateStatus: TodayDealsStateStatus.DAAKESHLOADING,
      ));
    } else {
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.DAAKESHLOADING,
        daakeshTodayDealsListData: [],
        daakeshCurrentPage: 1,
      ));
    }

    final result = await getIt
        .get<HomeUseCases>()
        .getTodayItemsData(HomeTodayItemType.Daakesh, state.daakeshCurrentPage);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      int lastPage = todayItemModel.data!.lastPage!;
      List<TodayItem> newResultList =
          todayItemModel.data!.todayItemList!.toList();
      List<TodayItem> daakeshTodayDealsListData =
          state.daakeshTodayDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.DAAKESHNULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      daakeshTodayDealsListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        daakeshTodayDealsListData: daakeshTodayDealsListData,
        isMoreDaakeshData: lastPage == state.daakeshCurrentPage,
      ));
    });
  }
}
