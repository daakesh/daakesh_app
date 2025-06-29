import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class TrendDealsBloc extends Bloc<TrendDealsEvent, TrendDealsState> {
  TrendDealsBloc() : super(const TrendDealsState()) {
    on<GetTrendDealsDataEvent>(_getTodayDealsData);
    on<GetItemsViewAllsEvent>(_getItemsViewAlls);
    on<ResetViewAllValueEvent>(_resetViewAllValue);
    on<SetViewAllFilterDataEvent>(_setViewAllFilterData);
    on<GetViewAllsCitiesEvent>(_getViewAllsCities);
    on<UpdateTrendDealsItemFavoriteEvent>(_updateTrendDealsItemFavorite);
  }

  static TrendDealsBloc get get => BlocProvider.of(Utils.currentContext);

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

    final result = await getIt.get<SwapUseCases>().getTodayItemsData(
        SwapFilterDataModel(), state.currentPage, SortingType.desc);
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
          trendDealsModel.data!.trendDealsData!.toList();
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

  FutureOr<void> _getItemsViewAlls(
      GetItemsViewAllsEvent event, Emitter<TrendDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        swapTodayDealsStateStatus: SwapTodayDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          swapTodayDealsStateStatus: SwapTodayDealsStateStatus.LOADING,
          isMoreDataItems: true,
          isFilterActive: event.isFilterActive,
          sortingType: event.sortingType,
          trendDealListData: [],
          itemsCurrentPage: 1));
    }
    SwapFilterDataModel filterDataModel = SwapFilterDataModel();
    if (state.isFilterActive) {
      filterDataModel
        ..type = state.type.name
        ..fromPrice = '${state.fromPrice.toInt()}'
        ..toPrice = '${state.toPrice.toInt()}'
        ..country = state.country
        ..city = state.city
        ..rate = '${state.rate}';
    }

    final result = await getIt.get<SwapUseCases>().getTodayItemsData(
        filterDataModel, state.currentPage, SortingType.desc);
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
          trendDealsModel.data!.trendDealsData!.toList();
      List<TrendDealsItem> trendDealListData = state.trendDealListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapTodayDealsStateStatus: SwapTodayDealsStateStatus.NULL,
          isMoreDataItems: lastPage == state.itemsCurrentPage,
        ));
        return;
      }
      trendDealListData.addAll(newResultList);
      // Deduplicate by id
      final seen = <int>{};
      trendDealListData = trendDealListData.where((item) {
        final id = item.id;
        if (id == null) return false;
        if (seen.contains(id)) return false;
        seen.add(id);
        return true;
      }).toList();
      emit(state.copyWith(
        swapTodayDealsStateStatus: SwapTodayDealsStateStatus.SUCCESS,
        trendDealListData: trendDealListData,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _resetViewAllValue(
      ResetViewAllValueEvent event, Emitter<TrendDealsState> emit) {
    emit(state.copyWith(
      trendDealListData: [],
      isMoreDataItems: true,
      country: "Jordan",
      city: "Amman",
      rate: 0,
      fromPrice: 0.0,
      toPrice: 500.0,
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _setViewAllFilterData(
      SetViewAllFilterDataEvent event, Emitter<TrendDealsState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _getViewAllsCities(
      GetViewAllsCitiesEvent event, Emitter<TrendDealsState> emit) async {
    final result = await getIt.get<SwapUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(
          swapTodayDealsStateStatus: SwapTodayDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      CitiesModel citiesModel = CitiesModel.fromJson(r.data);
      List<CityItem> cityItemList = citiesModel.data!.toList();
      emit(state.copyWith(cityItemList: cityItemList));
    });
  }

  FutureOr<void> _updateTrendDealsItemFavorite(
      UpdateTrendDealsItemFavoriteEvent event, Emitter<TrendDealsState> emit) {
    // Update trendDealsListData
    List<TrendDealsItem> updatedTrendDealsListData =
        List.from(state.trendDealsListData);
    int index = updatedTrendDealsListData
        .indexWhere((element) => element.id == event.id);

    if (index != -1) {
      updatedTrendDealsListData[index] = updatedTrendDealsListData[index]
          .copyWith(isFavorite: event.isFavorite);
    }

    // Update trendDealListData (view all data)
    List<TrendDealsItem> updatedTrendDealListData =
        List.from(state.trendDealListData);
    int viewAllIndex = updatedTrendDealListData
        .indexWhere((element) => element.id == event.id);

    if (viewAllIndex != -1) {
      updatedTrendDealListData[viewAllIndex] =
          updatedTrendDealListData[viewAllIndex]
              .copyWith(isFavorite: event.isFavorite);
    }

    emit(state.copyWith(
      trendDealsListData: updatedTrendDealsListData,
      trendDealListData: updatedTrendDealListData,
    ));
  }
}
