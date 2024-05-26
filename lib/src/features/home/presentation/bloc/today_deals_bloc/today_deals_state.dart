import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum TodayDealsStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL,
  DAAKESHLOADINGMORE,
  DAAKESHLOADING,
  DAAKESHNULL,
}

extension TodayDealsStateStatusX on TodayDealsStateStatus {
  bool get isInitial => this == TodayDealsStateStatus.INITIAL;
  bool get isSuccess => this == TodayDealsStateStatus.SUCCESS;
  bool get isError => this == TodayDealsStateStatus.ERROR;
  bool get isLoading => this == TodayDealsStateStatus.LOADING;
  bool get isLoadingMore => this == TodayDealsStateStatus.LOADINGMORE;
  bool get isNull => this == TodayDealsStateStatus.NULL;
  bool get isDaakeshLoadingMore =>
      this == TodayDealsStateStatus.DAAKESHLOADINGMORE;
  bool get isDaakeshLoading => this == TodayDealsStateStatus.DAAKESHLOADING;
  bool get isDaakeshNull => this == TodayDealsStateStatus.DAAKESHNULL;
}

class TodayDealsState extends Equatable {
  final TodayDealsStateStatus todayDealsStateStatus;
  final List<TodayItem> todayDealsListData;
  final int currentPage;
  final bool isMoreData;

  ///
  final List<TodayItem> daakeshTodayDealsListData;
  final int daakeshCurrentPage;
  final bool isMoreDaakeshData;

  ///
  final bool isDaakeshTodayDeal;

  ///
  final List<TodayItem> allTodayDealsListData;
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

  const TodayDealsState({
    this.todayDealsStateStatus = TodayDealsStateStatus.INITIAL,
    this.todayDealsListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,

    ///
    this.daakeshTodayDealsListData = const [],
    this.daakeshCurrentPage = 1,
    this.isMoreDaakeshData = true,

    ///
    this.isDaakeshTodayDeal = false,

    ///
    this.allTodayDealsListData = const [],
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
  });

  TodayDealsState copyWith({
    TodayDealsStateStatus? todayDealsStateStatus,
    List<TodayItem>? todayDealsListData,
    int? currentPage,
    bool? isMoreData,

    ///
    List<TodayItem>? daakeshTodayDealsListData,
    int? daakeshCurrentPage,
    bool? isMoreDaakeshData,

    ///
    bool? isDaakeshTodayDeal,

    ///
    List<TodayItem>? allTodayDealsListData,
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
  }) {
    return TodayDealsState(
      todayDealsStateStatus:
          todayDealsStateStatus ?? this.todayDealsStateStatus,
      todayDealsListData: todayDealsListData ?? this.todayDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

      ///
      daakeshTodayDealsListData:
          daakeshTodayDealsListData ?? this.daakeshTodayDealsListData,
      daakeshCurrentPage: daakeshCurrentPage ?? this.daakeshCurrentPage,
      isMoreDaakeshData: isMoreDaakeshData ?? this.isMoreDaakeshData,

      ///
      ///
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,

      ///
      allTodayDealsListData:
          allTodayDealsListData ?? this.allTodayDealsListData,
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
    );
  }

  @override
  List<Object?> get props => [
        todayDealsStateStatus,
        todayDealsListData,
        currentPage,
        isMoreData,

        ///
        daakeshTodayDealsListData,
        daakeshCurrentPage,
        isMoreDaakeshData,

        ///
        isDaakeshTodayDeal,
        allTodayDealsListData,
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
      ];
}
