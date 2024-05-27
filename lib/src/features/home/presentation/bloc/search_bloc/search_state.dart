import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SearchStateStatus {
  INITIAL,
  SEARCHLOADING,
  NULLSEARCH,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL,
  ITEMLOADING,
}

extension SearchStateStatusX on SearchStateStatus {
  bool get isInitial => this == SearchStateStatus.INITIAL;
  bool get isSuccess => this == SearchStateStatus.SUCCESS;
  bool get isError => this == SearchStateStatus.ERROR;
  bool get isLoading => this == SearchStateStatus.LOADING;
  bool get isItemLoading => this == SearchStateStatus.ITEMLOADING;
  bool get isSearchLoading => this == SearchStateStatus.SEARCHLOADING;
  bool get isNullSearch => this == SearchStateStatus.NULLSEARCH;
  bool get isLoadingMore => this == SearchStateStatus.LOADINGMORE;
  bool get isNull => this == SearchStateStatus.NULL;
}

class SearchState extends Equatable {
  final SearchStateStatus searchStateStatus;
  final List<String> searchResultList;
  final int currentSearchPage;
  final String searchValue;
  final bool isMoreData;
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;
  final int filterCurrentPage;
  final List<TodayItem> filterDataList;
  final bool isMoreDataItems;
  final SortingType sortingType;

  const SearchState({
    this.searchStateStatus = SearchStateStatus.INITIAL,
    this.searchResultList = const [],
    this.currentSearchPage = 1,
    this.searchValue = '',
    this.isMoreData = true,
    this.country = 'Jordan',
    this.city = 'Amman',
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 500.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.filterCurrentPage = 1,
    this.filterDataList = const [],
    this.isMoreDataItems = true,
    this.sortingType = SortingType.desc,
  });

  SearchState copyWith(
      {SearchStateStatus? searchStateStatus,
      List<String>? searchResultList,
      int? currentSearchPage,
      String? searchValue,
      bool? isMoreData,
      String? country,
      String? city,
      int? rate,
      double? fromPrice,
      double? toPrice,
      FilterProductType? type,
      bool? isFilterActive,
      int? filterCurrentPage,
      List<TodayItem>? filterDataList,
      bool? isMoreDataItems,
      SortingType? sortingType}) {
    return SearchState(
      searchStateStatus: searchStateStatus ?? this.searchStateStatus,
      searchResultList: searchResultList ?? this.searchResultList,
      currentSearchPage: currentSearchPage ?? this.currentSearchPage,
      searchValue: searchValue ?? this.searchValue,
      isMoreData: isMoreData ?? this.isMoreData,
      country: country ?? this.country,
      city: city ?? this.city,
      rate: rate ?? this.rate,
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      type: type ?? this.type,
      isFilterActive: isFilterActive ?? this.isFilterActive,
      filterCurrentPage: filterCurrentPage ?? this.filterCurrentPage,
      filterDataList: filterDataList ?? this.filterDataList,
      isMoreDataItems: isMoreDataItems ?? this.isMoreDataItems,
      sortingType: sortingType ?? this.sortingType,
    );
  }

  @override
  List<Object?> get props => [
        searchStateStatus,
        searchResultList,
        currentSearchPage,
        searchValue,
        isMoreData,
        country,
        city,
        rate,
        fromPrice,
        toPrice,
        type,
        isFilterActive,
        filterDataList,
        isMoreDataItems,
        sortingType,
      ];
}
