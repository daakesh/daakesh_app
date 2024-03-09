import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapRateStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension SwapRateStateStatusX on SwapRateStateStatus{
  bool get isInitial => this == SwapRateStateStatus.INITIAL;
  bool get isSuccess => this == SwapRateStateStatus.SUCCESS;
  bool get isError => this == SwapRateStateStatus.ERROR;
  bool get isLoading => this == SwapRateStateStatus.LOADING;
  bool get isLoadingMore => this == SwapRateStateStatus.LOADINGMORE;
  bool get isNull => this == SwapRateStateStatus.NULL;
}

class SwapRateState extends Equatable {
  final SwapRateStateStatus swapRateStateStatus;


  const SwapRateState({
    this.swapRateStateStatus = SwapRateStateStatus.INITIAL,

  });

  SwapRateState copyWith({
    SwapRateStateStatus? swapRateStateStatus,

  }) {
    return SwapRateState(
      swapRateStateStatus: swapRateStateStatus ?? this.swapRateStateStatus,


    );
  }

  @override
  List<Object?> get props => [
    swapRateStateStatus,
  ];
}


