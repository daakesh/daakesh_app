import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum FilterStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension FilterStateStatusX on FilterStateStatus {
  bool get isInitial => this == FilterStateStatus.INITIAL;
  bool get isSuccess => this == FilterStateStatus.SUCCESS;
  bool get isError => this == FilterStateStatus.ERROR;
  bool get isLoading => this == FilterStateStatus.LOADING;
  bool get isLoadingMore => this == FilterStateStatus.LOADINGMORE;
  bool get isNull => this == FilterStateStatus.NULL;
}

class FilterState extends Equatable {
  final FilterStateStatus filterStateStatus;
  final List<TodayItem> subCategoryListData;
  final int catID;
  final String country;
  final String city;
  final int rate;
  final double fromPrice;
  final double toPrice;
  final FilterProductType type;
  final bool isFilterActive;
  final List<CityItem> cityItemList;
  final SortingType sortingType;

  ///
  final int currentPage;
  final bool isMoreData;

  ///
  final int categoryIndex;

  const FilterState({
    this.filterStateStatus = FilterStateStatus.INITIAL,
    this.subCategoryListData = const [],
    this.catID = 0,
    this.country = 'Jordan',
    this.city = 'Amman',
    this.rate = 0,
    this.fromPrice = 0.0,
    this.toPrice = 500.0,
    this.type = FilterProductType.All,
    this.isFilterActive = false,
    this.currentPage = 1,
    this.isMoreData = true,
    this.categoryIndex = 0,
    this.cityItemList = const [],
    this.sortingType = SortingType.desc,
  });

  FilterState copyWith({
    FilterStateStatus? filterStateStatus,
    List<TodayItem>? subCategoryListData,
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
    SortingType? sortingType,
  }) {
    return FilterState(
      filterStateStatus: filterStateStatus ?? this.filterStateStatus,
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
    );
  }

  @override
  List<Object?> get props => [
        filterStateStatus,
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
      ];
}
