import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum BrandsStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension BrandsStateStatusX on BrandsStateStatus {
  bool get isInitial => this == BrandsStateStatus.INITIAL;
  bool get isSuccess => this == BrandsStateStatus.SUCCESS;
  bool get isError => this == BrandsStateStatus.ERROR;
  bool get isLoading => this == BrandsStateStatus.LOADING;
  bool get isLoadingMore => this == BrandsStateStatus.LOADINGMORE;
  bool get isNull => this == BrandsStateStatus.NULL;
}

class BrandsState extends Equatable {
  final BrandsStateStatus brandsStateStatus;
  final List<BrandItem> brandListData;
  final int currentPage;
  final bool isMoreData;
  final List<TodayItem> itemByBrandList;
  final int itemsCurrentPage;
  final int brandID;
  final bool isMoreDataItems;
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;
  final List<CityItem> cityItemList;

  const BrandsState({
    this.brandsStateStatus = BrandsStateStatus.INITIAL,
    this.brandListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,
    this.itemByBrandList = const [],
    this.itemsCurrentPage = 1,
    this.brandID = 0,
    this.isMoreDataItems = true,
    this.country = '',
    this.city = '',
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 0.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.cityItemList = const [],
  });

  BrandsState copyWith({
    BrandsStateStatus? brandsStateStatus,
    List<BrandItem>? brandListData,
    int? currentPage,
    bool? isMoreData,
    List<TodayItem>? itemByBrandList,
    int? itemsCurrentPage,
    bool? isMoreDataItems,
    int? brandID,
    String? country,
    String? city,
    int? rate,
    double? fromPrice,
    double? toPrice,
    FilterProductType? type,
    bool? isFilterActive,
    List<CityItem>? cityItemList,
  }) {
    return BrandsState(
      brandsStateStatus: brandsStateStatus ?? this.brandsStateStatus,
      brandListData: brandListData ?? this.brandListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      itemByBrandList: itemByBrandList ?? this.itemByBrandList,
      itemsCurrentPage: itemsCurrentPage ?? this.itemsCurrentPage,
      isMoreDataItems: isMoreDataItems ?? this.isMoreDataItems,
      brandID: brandID ?? this.brandID,
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
        brandsStateStatus,
        brandListData,
        currentPage,
        isMoreData,
        itemByBrandList,
        itemsCurrentPage,
        isMoreDataItems,
        brandID,
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
