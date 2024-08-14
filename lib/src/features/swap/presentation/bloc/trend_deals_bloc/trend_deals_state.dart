import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapTodayDealsStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension SwapTodayDealsStateStatusX on SwapTodayDealsStateStatus {
  bool get isInitial => this == SwapTodayDealsStateStatus.INITIAL;
  bool get isSuccess => this == SwapTodayDealsStateStatus.SUCCESS;
  bool get isError => this == SwapTodayDealsStateStatus.ERROR;
  bool get isLoading => this == SwapTodayDealsStateStatus.LOADING;
  bool get isLoadingMore => this == SwapTodayDealsStateStatus.LOADINGMORE;
  bool get isNull => this == SwapTodayDealsStateStatus.NULL;
}

class TrendDealsState extends Equatable {
  final SwapTodayDealsStateStatus swapTodayDealsStateStatus;
  final List<TrendDealsItem> trendDealsListData;
  final int currentPage;
  final bool isMoreData;

  ///
  final List<TrendDealsItem> trendDealListData;
  final int itemsCurrentPage;
  final bool isMoreDataItems;
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;
  final List<CityItem> cityItemList;
  final SortingType sortingType;

  const TrendDealsState({
    this.swapTodayDealsStateStatus = SwapTodayDealsStateStatus.INITIAL,
    this.trendDealsListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,

    ///
    this.trendDealListData = const [],
    this.itemsCurrentPage = 1,
    this.isMoreDataItems = true,
    this.country = "Jordan",
    this.city = "Amman",
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 500.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.cityItemList = const [],
    this.sortingType = SortingType.desc,
  });

  TrendDealsState copyWith({
    SwapTodayDealsStateStatus? swapTodayDealsStateStatus,
    List<TrendDealsItem>? trendDealsListData,
    int? currentPage,
    bool? isMoreData,

    ///
    List<TrendDealsItem>? trendDealListData,
    int? itemsCurrentPage,
    bool? isMoreDataItems,
    String? country,
    String? city,
    int? rate,
    double? fromPrice,
    double? toPrice,
    FilterProductType? type,
    bool? isFilterActive,
    List<CityItem>? cityItemList,
    SortingType? sortingType,
  }) {
    return TrendDealsState(
      swapTodayDealsStateStatus:
          swapTodayDealsStateStatus ?? this.swapTodayDealsStateStatus,
      trendDealsListData: trendDealsListData ?? this.trendDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

      ///
      trendDealListData: trendDealListData ?? this.trendDealListData,
      itemsCurrentPage: itemsCurrentPage ?? this.itemsCurrentPage,
      isMoreDataItems: isMoreDataItems ?? this.isMoreDataItems,
      country: country ?? this.country,
      city: city ?? this.city,
      rate: rate ?? this.rate,
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      type: type ?? this.type,
      isFilterActive: isFilterActive ?? this.isFilterActive,
      cityItemList: cityItemList ?? this.cityItemList,
      sortingType: sortingType ?? this.sortingType,
    );
  }

  @override
  List<Object?> get props => [
        swapTodayDealsStateStatus,
        trendDealsListData,
        currentPage,
        isMoreData,
        trendDealListData,
        itemsCurrentPage,
        isMoreDataItems,
        country,
        city,
        rate,
        fromPrice,
        toPrice,
        type,
        isFilterActive,
        cityItemList,
        sortingType,
      ];
}
