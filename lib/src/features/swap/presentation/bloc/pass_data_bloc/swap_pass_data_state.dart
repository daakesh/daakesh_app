import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SwapPassDataStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension SwapPassDataStateStatusX on SwapPassDataStateStatus{
  bool get isInitial => this == SwapPassDataStateStatus.INITIAL;
  bool get isSuccess => this == SwapPassDataStateStatus.SUCCESS;
  bool get isError => this == SwapPassDataStateStatus.ERROR;
  bool get isLoading => this == SwapPassDataStateStatus.LOADING;
}

class SwapPassDataState extends Equatable {
  final SwapPassDataStateStatus swapPassDataStatus;
  final List<SwapCategoryItem> swapCategoriesListData;
  final List<SwapSubCategory> swapSubCategoryListData;
  final List<TrendDealsItem> trendDealsListData;
  final int sliderIndex;

  const SwapPassDataState({
    this.swapPassDataStatus = SwapPassDataStateStatus.INITIAL,
    this.swapCategoriesListData = const[],
    this.swapSubCategoryListData = const[],
    this.trendDealsListData = const[],
    this.sliderIndex = 0,

  });

  SwapPassDataState copyWith({
    SwapPassDataStateStatus? swapPassDataStatus,
    List<SwapCategoryItem>? swapCategoriesListData,
    List<SwapSubCategory>? swapSubCategoryListData,
    List<TrendDealsItem>? trendDealsListData,
    int? sliderIndex,
  }) {
    return SwapPassDataState(
      swapPassDataStatus: swapPassDataStatus ?? this.swapPassDataStatus,
      swapCategoriesListData: swapCategoriesListData ?? this.swapCategoriesListData,
      swapSubCategoryListData: swapSubCategoryListData ?? this.swapSubCategoryListData,
      trendDealsListData: trendDealsListData ?? this.trendDealsListData,
      sliderIndex: sliderIndex ?? this.sliderIndex,

    );
  }

  @override
  List<Object?> get props => [
    swapPassDataStatus,
    swapCategoriesListData,
    swapSubCategoryListData,
    trendDealsListData,
    sliderIndex,
  ];
}
