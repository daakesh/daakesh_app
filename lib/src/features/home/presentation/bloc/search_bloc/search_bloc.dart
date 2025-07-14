import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchOnItemsEvent>(_searchOnItems);
    on<SearchFilterEvent>(_searchFilter);
    on<SetSearchFilterDataEvent>(_setSearchFilterData);
    on<ClearSearchFilterDataEvent>(_clearSearchFilterData);
    on<EmptySearchEvent>(_emptySearch);
    on<UpdateSearchItemEvent>(_updateSearchItem);
  }
  static SearchBloc get get => BlocProvider.of(Utils.currentContext);

  ///Action to search on items.
  FutureOr<void> _searchOnItems(
      SearchOnItemsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchValue: event.searchValue));
    if (event.isSeeMore) {
      emit(state.copyWith(
          currentSearchPage: state.currentSearchPage + 1,
          searchStateStatus: SearchStateStatus.LOADINGMORE));
    } else {
      emit(state.copyWith(
          searchStateStatus: SearchStateStatus.SEARCHLOADING,
          currentSearchPage: 1));
    }
    final result = await getIt.get<HomeUseCases>().searchOnItems(
        event.searchValue.toString(), state.currentSearchPage, 10);
    result.fold((l) {
      emit(state.copyWith(searchStateStatus: SearchStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      SearchModel searchModel = SearchModel.fromJson(r.data);
      int lastPage = searchModel.data!.lastPage!;
      List<String> newResultList = searchModel.data!.data!.toList();
      List<String> searchResultList = state.searchResultList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          searchStateStatus: SearchStateStatus.NULLSEARCH,
          searchResultList: searchResultList,
          isMoreData: lastPage == state.currentSearchPage,
        ));
        return;
      }
      searchResultList.addAll(newResultList);

      emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        searchResultList: searchResultList,
        isMoreData: lastPage == state.currentSearchPage,
      ));
    });
  }

  FutureOr<void> _searchFilter(
      SearchFilterEvent event, Emitter<SearchState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        filterCurrentPage: state.filterCurrentPage + 1,
        searchStateStatus: SearchStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          searchStateStatus: SearchStateStatus.ITEMLOADING,
          isMoreData: true,
          searchValue: event.searchValue ?? state.searchValue,
          isFilterActive: event.isFilterActive,
          sortingType: event.sortingType,
          filterDataList: [],
          filterCurrentPage: 1));
    }
    FilterDataModel filterDataModel = FilterDataModel();
    if (state.isFilterActive) {
      filterDataModel
        ..type = state.type.name
        ..fromPrice = '${state.fromPrice.toInt()}'
        ..toPrice = '${state.toPrice.toInt()}'
        ..country = state.country
        ..city = state.city
        ..rate = '${state.rate}';
    }

    final result = await getIt.get<HomeUseCases>().getSearchItemsResult(
        state.searchValue,
        filterDataModel,
        state.filterCurrentPage,
        state.sortingType);
    result.fold((l) {
      emit(state.copyWith(searchStateStatus: SearchStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      TodayItemModel filterModel =
          TodayItemModel.fromJson(r.data as Map<String, dynamic>);
      List<TodayItem> newResultList = filterModel.data!.todayItemList!.toList();
      int lastPage = filterModel.data!.lastPage!;
      List<TodayItem> filterDataList = state.filterDataList.toList();

      if (newResultList.isEmpty) {
        emit(state.copyWith(
          searchStateStatus: SearchStateStatus.NULL,
          isMoreData: lastPage == state.filterCurrentPage,
        ));
        return;
      }
      filterDataList.addAll(newResultList);
      emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        filterDataList: filterDataList,
        isMoreData: lastPage == state.filterCurrentPage,
      ));
    });
  }

  FutureOr<void> _emptySearch(
      EmptySearchEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        searchResultList: [],
        searchValue: '',
        currentSearchPage: 1,
        isMoreData: true));
  }

  FutureOr<void> _setSearchFilterData(
      SetSearchFilterDataEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _clearSearchFilterData(
      ClearSearchFilterDataEvent event, Emitter<SearchState> emit) {
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

  FutureOr<void> _updateSearchItem(
      UpdateSearchItemEvent event, Emitter<SearchState> emit) {
    List<TodayItem> updatedTodayDealList = List.from(state.filterDataList);
    int index =
        updatedTodayDealList.indexWhere((element) => element.id == event.id);

    if (index != -1) {
      updatedTodayDealList[index] = updatedTodayDealList[index]
          .copyWith(averageRating: event.avgRating, rateCount: event.rateCount);
      emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        filterDataList: updatedTodayDealList,
      ));
    }
  }
}
