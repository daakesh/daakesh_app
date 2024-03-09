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

  const SwapPassDataState({
    this.swapPassDataStatus = SwapPassDataStateStatus.INITIAL,
    this.swapCategoriesListData = const[],
    this.swapSubCategoryListData = const[],

  });

  SwapPassDataState copyWith({
    SwapPassDataStateStatus? swapPassDataStatus,
    List<SwapCategoryItem>? swapCategoriesListData,
    List<SwapSubCategory>? swapSubCategoryListData,
  }) {
    return SwapPassDataState(
      swapPassDataStatus: swapPassDataStatus ?? this.swapPassDataStatus,
      swapCategoriesListData: swapCategoriesListData ?? this.swapCategoriesListData,
      swapSubCategoryListData: swapSubCategoryListData ?? this.swapSubCategoryListData,

    );
  }

  @override
  List<Object?> get props => [
    swapPassDataStatus,
    swapCategoriesListData,
    swapSubCategoryListData,

  ];
}
