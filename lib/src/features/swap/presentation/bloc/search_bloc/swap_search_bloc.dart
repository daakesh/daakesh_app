import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchBloc extends Bloc<SwapSearchEvent, SwapSearchState> {
  SwapSearchBloc() : super(const SwapSearchState()) {
    on<SwapSearchOnItemsEvent>(_searchOnItems);
    on<SwapEmptySearchEvent>(_emptySearch);
    on<SwapSearchFilterEvent>(_searchFilter);
    on<SwapSetSearchFilterDataEvent>(_setSearchFilterData);
    on<SwapClearSearchFilterDataEvent>(_clearSearchFilterData);
  }

  static SwapSearchBloc get get => BlocProvider.of(Utils.currentContext);

  ///Action to search on items.
  FutureOr<void> _searchOnItems(
      SwapSearchOnItemsEvent event, Emitter<SwapSearchState> emit) async {
    emit(state.copyWith(
      searchValue: event.searchValue,
    ));
    if (event.isSeeMore) {
      emit(state.copyWith(
          currentSearchPage: state.currentSearchPage + 1,
          swapSearchStateStatus: SwapSearchStateStatus.LOADINGMORE));
    } else {
      emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.LOADING,
          currentSearchPage: 1));
    }
    final result = await getIt.get<SwapUseCases>().searchOnItems(
        event.searchValue.toString(), state.currentSearchPage, 1);
    result.fold((l) {
      emit(state.copyWith(swapSearchStateStatus: SwapSearchStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TrendDealsModel searchModel = TrendDealsModel.fromJson(r.data);
      int lastPage = searchModel.data!.lastPage!;
      List<TrendDealsItem> newResultList =
          searchModel.data!.trendDealsData!.toList();
      List<TrendDealsItem> swapSearchResultList =
          state.swapSearchResultList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.NULL,
          swapSearchResultList: swapSearchResultList,
          isMoreData: lastPage == state.currentSearchPage,
        ));
        return;
      }
      swapSearchResultList.addAll(newResultList);

      emit(state.copyWith(
        swapSearchStateStatus: SwapSearchStateStatus.SUCCESS,
        swapSearchResultList: swapSearchResultList,
        isMoreData: lastPage == state.currentSearchPage,
      ));
    });
  }

  FutureOr<void> _emptySearch(
      SwapEmptySearchEvent event, Emitter<SwapSearchState> emit) {
    emit(state.copyWith(
        swapSearchStateStatus: SwapSearchStateStatus.SUCCESS,
        swapSearchResultList: [],
        searchValue: '',
        currentSearchPage: 1,
        isMoreData: true));
  }

  FutureOr<void> _searchFilter(
      SwapSearchFilterEvent event, Emitter<SwapSearchState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        filterCurrentPage: state.filterCurrentPage + 1,
        swapSearchStateStatus: SwapSearchStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.ITEMLOADING,
          isMoreData: true,
          searchValue: event.searchValue ?? state.searchValue,
          isFilterActive: event.isFilterActive,
          sortingType: event.sortingType,
          filterDataList: [],
          filterCurrentPage: 1));
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

    final result = await getIt.get<SwapUseCases>().getSearchItemsResult(
        state.searchValue,
        filterDataModel,
        state.filterCurrentPage,
        state.sortingType);
    result.fold((l) {
      emit(state.copyWith(swapSearchStateStatus: SwapSearchStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TrendDealsModel filterModel =
          TrendDealsModel.fromJson(r.data as Map<String, dynamic>);
      List<TrendDealsItem> newResultList =
          filterModel.data!.trendDealsData!.toList();
      int lastPage = filterModel.data!.lastPage!;
      List<TrendDealsItem> filterDataList = state.filterDataList.toList();

      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.NULL,
          isMoreDataItems: lastPage == state.filterCurrentPage,
        ));
        return;
      }
      filterDataList.addAll(newResultList);
      emit(state.copyWith(
        swapSearchStateStatus: SwapSearchStateStatus.SUCCESS,
        filterDataList: filterDataList,
        isMoreDataItems: lastPage == state.filterCurrentPage,
      ));
    });
  }

  FutureOr<void> _setSearchFilterData(
      SwapSetSearchFilterDataEvent event, Emitter<SwapSearchState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _clearSearchFilterData(
      SwapClearSearchFilterDataEvent event, Emitter<SwapSearchState> emit) {
    emit(state.copyWith(
      country: "Jordan",
      city: "Amman",
      rate: 0,
      fromPrice: 0.0,
      toPrice: 500.0,
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }
}
