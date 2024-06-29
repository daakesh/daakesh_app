import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SwapFilterStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension SwapFilterStateStatusX on SwapFilterStateStatus {
  bool get isInitial => this == SwapFilterStateStatus.INITIAL;
  bool get isSuccess => this == SwapFilterStateStatus.SUCCESS;
  bool get isError => this == SwapFilterStateStatus.ERROR;
  bool get isLoading => this == SwapFilterStateStatus.LOADING;
  bool get isLoadingMore => this == SwapFilterStateStatus.LOADINGMORE;
  bool get isNull => this == SwapFilterStateStatus.NULL;
}

class SwapFilterState extends Equatable {
  final SwapFilterStateStatus swapFilterStateStatus;
  final List<TrendDealsItem> subCategoryListData;
  final int catID;
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;

  ///
  final int currentPage;
  final bool isMoreData;

  ///
  final int categoryIndex;
  final List<CityItem> cityItemList;
  final SortingType sortingType;
  final bool isAllItems;
  final List<SubCategory> subCategoryList;

  const SwapFilterState({
    this.swapFilterStateStatus = SwapFilterStateStatus.INITIAL,
    this.subCategoryListData = const [],
    this.catID = 0,
    this.country = 'Jordan',
    this.city = 'Amman',
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 1000.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.currentPage = 1,
    this.isMoreData = true,
    this.categoryIndex = 0,
    this.cityItemList = const [],
    this.sortingType = SortingType.desc,
    this.isAllItems = true,
    this.subCategoryList = const [],
  });

  SwapFilterState copyWith(
      {SwapFilterStateStatus? swapFilterStateStatus,
      List<TrendDealsItem>? subCategoryListData,
      int? catID,
      String? country,
      String? city,
      int? rate,
      double? fromPrice,
      double? toPrice,
      FilterProductType? type,
      bool? isFilterActive,
      int? currentPage,
      bool? isMoreData,
      int? categoryIndex,
      List<CityItem>? cityItemList,
      bool? isAllItems,
      List<SubCategory>? subCategoryList,
      SortingType? sortingType}) {
    return SwapFilterState(
      swapFilterStateStatus:
          swapFilterStateStatus ?? this.swapFilterStateStatus,
      subCategoryListData: subCategoryListData ?? this.subCategoryListData,
      catID: catID ?? this.catID,
      country: country ?? this.country,
      city: city ?? this.city,
      rate: rate ?? this.rate,
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      type: type ?? this.type,
      isFilterActive: isFilterActive ?? this.isFilterActive,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      cityItemList: cityItemList ?? this.cityItemList,
      sortingType: sortingType ?? this.sortingType,
      isAllItems: isAllItems ?? this.isAllItems,
      subCategoryList: subCategoryList ?? this.subCategoryList,
    );
  }

  @override
  List<Object?> get props => [
        swapFilterStateStatus,
        subCategoryListData,
        catID,
        country,
        city,
        rate,
        fromPrice,
        toPrice,
        type,
        isFilterActive,
        currentPage,
        isMoreData,
        categoryIndex,
        cityItemList,
        sortingType,
        isAllItems,
        subCategoryList,
      ];
}
