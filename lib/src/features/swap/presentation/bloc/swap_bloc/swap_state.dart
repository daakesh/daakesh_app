import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension SwapStateStatusX on SwapStateStatus{
  bool get isInitial => this == SwapStateStatus.INITIAL;
  bool get isSuccess => this == SwapStateStatus.SUCCESS;
  bool get isError => this == SwapStateStatus.ERROR;
  bool get isLoading => this == SwapStateStatus.LOADING;
}

class SwapState extends Equatable {
  final SwapStateStatus swapStateStatus;
  final SwapScreenState swapScreenState;
  ///Filter screen State
  final int rateIndex;
  final int productTypeIndex;
  ///Product screen details state
  final bool isDaakeshTodayDeal;
  ///More Info Product Screen
  final int productSliderIndex;
  final int productSizeIndex;
  ///API Data
  final List<SwapSectionItemModel> swapSectionListData;





  const SwapState({
    this.swapStateStatus = SwapStateStatus.INITIAL,
    this.swapScreenState = SwapScreenState.HOME,
    ///Filter screen State
    this.rateIndex = 1,
    this.productTypeIndex = 0,
    ///Product screen details state
    this.isDaakeshTodayDeal = false,
    ///More Info Product Screen
    this.productSliderIndex = 0,
    this.productSizeIndex = 0,
    ///API Data.
    this.swapSectionListData = const[],



  });

  SwapState copyWith({
    SwapStateStatus? swapStateStatus,
    SwapScreenState? swapScreenState,
    int? rateIndex,
    int? productTypeIndex,
    ///Product screen details state
    bool? isDaakeshTodayDeal,
    ///More Info Product Screen
    int? productSliderIndex,
    int? productSizeIndex,
    ///API Data
    List<SwapSectionItemModel>? swapSectionListData,


  }) {
    return SwapState(
      swapStateStatus: swapStateStatus ?? this.swapStateStatus,
      swapScreenState: swapScreenState ?? this.swapScreenState,
      ///Filter screen States
      rateIndex: rateIndex ?? this.rateIndex,
      productTypeIndex: productTypeIndex ?? this.productTypeIndex,
      ///Product screen details states
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,
      ///More Info Product Screen
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,
      productSizeIndex: productSizeIndex ?? this.productSizeIndex,
      ///API Data
      swapSectionListData: swapSectionListData ?? this.swapSectionListData,


    );
  }

  @override
  List<Object?> get props => [
    swapStateStatus,
    swapScreenState,
    ///Filter screen States
    rateIndex,
    productTypeIndex,
    ///Product screen details states
    isDaakeshTodayDeal,
    ///More Info Product Screen
    productSliderIndex,
    productSizeIndex,
    ///API Data
    swapSectionListData,
  ];
}
