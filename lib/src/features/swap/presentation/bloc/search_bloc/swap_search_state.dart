import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapSearchStateStatus {
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

extension SwapSearchStateStatusX on SwapSearchStateStatus {
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

class SwapSearchState extends Equatable {
  final SwapSearchStateStatus swapSearchStateStatus;
  final List<TrendDealsItem> swapSearchResultList;
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
  final List<TrendDealsItem> filterDataList;
  final bool isMoreDataItems;

  const SwapSearchState({
    this.swapSearchStateStatus = SwapSearchStateStatus.INITIAL,
    this.swapSearchResultList = const [],
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
  });

  SwapSearchState copyWith({
    SwapSearchStateStatus? swapSearchStateStatus,
    List<TrendDealsItem>? swapSearchResultList,
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
    List<TrendDealsItem>? filterDataList,
    bool? isMoreDataItems,
  }) {
    return SwapSearchState(
      swapSearchStateStatus:
          swapSearchStateStatus ?? this.swapSearchStateStatus,
      swapSearchResultList: swapSearchResultList ?? this.swapSearchResultList,
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
    );
  }

  @override
  List<Object?> get props => [
        swapSearchStateStatus,
        swapSearchResultList,
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
      ];
}
