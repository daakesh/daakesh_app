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
  final double scale;
  final List<MyProductItem> mySwapProductData;
  final List<MyProductItem> itemSelected;
  final String comment;
  const SwapPassDataState({
    this.swapPassDataStatus = SwapPassDataStateStatus.INITIAL,
    this.swapCategoriesListData = const[],
    this.swapSubCategoryListData = const[],
    this.trendDealsListData = const[],
    this.sliderIndex = 0,
    this.scale = 1.0,
    this.mySwapProductData = const[],
    this.itemSelected = const[],
    this.comment = '',

  });

  SwapPassDataState copyWith({
    SwapPassDataStateStatus? swapPassDataStatus,
    List<SwapCategoryItem>? swapCategoriesListData,
    List<SwapSubCategory>? swapSubCategoryListData,
    List<TrendDealsItem>? trendDealsListData,
    int? sliderIndex,
    double? scale,
    List<MyProductItem>? mySwapProductData,
    List<MyProductItem>? itemSelected,
    String? comment,
  }) {
    return SwapPassDataState(
      swapPassDataStatus: swapPassDataStatus ?? this.swapPassDataStatus,
      swapCategoriesListData: swapCategoriesListData ?? this.swapCategoriesListData,
      swapSubCategoryListData: swapSubCategoryListData ?? this.swapSubCategoryListData,
      trendDealsListData: trendDealsListData ?? this.trendDealsListData,
      sliderIndex: sliderIndex ?? this.sliderIndex,
      scale: scale ?? this.scale,
      mySwapProductData: mySwapProductData ?? this.mySwapProductData,
      itemSelected: itemSelected ?? this.itemSelected,
      comment: comment ?? this.comment,

    );
  }

  @override
  List<Object?> get props => [
    swapPassDataStatus,
    swapCategoriesListData,
    swapSubCategoryListData,
    trendDealsListData,
    sliderIndex,
    scale,
    mySwapProductData,
    itemSelected,
    comment,
  ];
}
