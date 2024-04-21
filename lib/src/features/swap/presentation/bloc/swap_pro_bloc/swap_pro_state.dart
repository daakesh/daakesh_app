import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapProStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension SwapProStateStatusX on SwapProStateStatus{
  bool get isInitial => this == SwapProStateStatus.INITIAL;
  bool get isSuccess => this == SwapProStateStatus.SUCCESS;
  bool get isError => this == SwapProStateStatus.ERROR;
  bool get isLoading => this == SwapProStateStatus.LOADING;
}

class SwapProState extends Equatable {
  final SwapProStateStatus swapProStateStatus;
  final List<MyProductItem> mySwapProductListData;

  const SwapProState({
    this.swapProStateStatus = SwapProStateStatus.INITIAL,
    this.mySwapProductListData = const[],
  });

  SwapProState copyWith({
     SwapProStateStatus? swapProStateStatus,
     List<MyProductItem>? mySwapProductListData,
  }) {
    return SwapProState(
      swapProStateStatus: swapProStateStatus ?? this.swapProStateStatus,
      mySwapProductListData: mySwapProductListData ?? this.mySwapProductListData,
    );
  }

  @override
  List<Object?> get props => [
    swapProStateStatus,
    mySwapProductListData,
  ];
}
