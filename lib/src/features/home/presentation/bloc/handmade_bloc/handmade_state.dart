import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum HandmadeStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension HandmadeStateStatusX on HandmadeStateStatus {
  bool get isInitial => this == HandmadeStateStatus.INITIAL;
  bool get isSuccess => this == HandmadeStateStatus.SUCCESS;
  bool get isError => this == HandmadeStateStatus.ERROR;
  bool get isLoading => this == HandmadeStateStatus.LOADING;
  bool get isLoadingMore => this == HandmadeStateStatus.LOADINGMORE;
  bool get isNull => this == HandmadeStateStatus.NULL;
}

class HandmadeState extends Equatable {
  final HandmadeStateStatus handmadeStateStatus;
  final List<TodayItem> handmadeListData;
  final int currentPage;
  final bool isMoreData;
  final List<TodayItem> itemByHandmadeList;
  final int itemsCurrentPage;
  final int homemadeID;
  final bool isMoreDataItems;

  ///
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;
  final List<CityItem> cityItemList;

  const HandmadeState({
    this.handmadeStateStatus = HandmadeStateStatus.INITIAL,
    this.handmadeListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,
    this.itemByHandmadeList = const [],
    this.itemsCurrentPage = 1,
    this.homemadeID = 0,
    this.isMoreDataItems = true,
    this.country = 'Jordan',
    this.city = 'Amman',
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 500.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.cityItemList = const [],
  });

  HandmadeState copyWith({
    HandmadeStateStatus? handmadeStateStatus,
    List<TodayItem>? handmadeListData,
    int? currentPage,
    bool? isMoreData,
    List<TodayItem>? itemByHandmadeList,
    int? itemsCurrentPage,
    bool? isMoreDataItems,
    int? homemadeID,
    String? country,
    String? city,
    int? rate,
    double? fromPrice,
    double? toPrice,
    FilterProductType? type,
    bool? isFilterActive,
    List<CityItem>? cityItemList,
  }) {
    return HandmadeState(
      handmadeStateStatus: handmadeStateStatus ?? this.handmadeStateStatus,
      handmadeListData: handmadeListData ?? this.handmadeListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      itemByHandmadeList: itemByHandmadeList ?? this.itemByHandmadeList,
      itemsCurrentPage: itemsCurrentPage ?? this.itemsCurrentPage,
      isMoreDataItems: isMoreDataItems ?? this.isMoreDataItems,
      homemadeID: homemadeID ?? this.homemadeID,
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
        handmadeStateStatus,
        handmadeListData,
        currentPage,
        isMoreData,
        itemByHandmadeList,
        itemsCurrentPage,
        isMoreDataItems,
        homemadeID,
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
