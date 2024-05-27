import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum OfferDealsStateStatus {
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

extension OfferDealsStateStatusX on OfferDealsStateStatus {
  bool get isInitial => this == OfferDealsStateStatus.INITIAL;
  bool get isSuccess => this == OfferDealsStateStatus.SUCCESS;
  bool get isError => this == OfferDealsStateStatus.ERROR;
  bool get isLoading => this == OfferDealsStateStatus.LOADING;
  bool get isLoadingMore => this == OfferDealsStateStatus.LOADINGMORE;
  bool get isNull => this == OfferDealsStateStatus.NULL;
  bool get isDaakeshLoadingMore =>
      this == OfferDealsStateStatus.DAAKESHLOADINGMORE;
  bool get isDaakeshLoading => this == OfferDealsStateStatus.DAAKESHLOADING;
  bool get isDaakeshNull => this == OfferDealsStateStatus.DAAKESHNULL;
}

class OfferDealsState extends Equatable {
  final OfferDealsStateStatus offerDealsStateStatus;
  final List<TodayItem> homeTodayDealsListData;
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
  final SortingType sortingType;

  const OfferDealsState(
      {this.offerDealsStateStatus = OfferDealsStateStatus.INITIAL,
      this.homeTodayDealsListData = const [],
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
      this.sortingType = SortingType.desc});

  OfferDealsState copyWith({
    OfferDealsStateStatus? offerDealsStateStatus,
    List<TodayItem>? allTodayDealsListData,
    List<TodayItem>? homeTodayDealsListData,
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
    return OfferDealsState(
      offerDealsStateStatus:
          offerDealsStateStatus ?? this.offerDealsStateStatus,
      homeTodayDealsListData:
          homeTodayDealsListData ?? this.homeTodayDealsListData,
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
      sortingType: sortingType ?? this.sortingType,
    );
  }

  @override
  List<Object?> get props => [
        offerDealsStateStatus,
        homeTodayDealsListData,
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
        sortingType,
      ];
}
