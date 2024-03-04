import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';
import '../../../swap.export.dart';

enum SwapAdvStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension SwapAdvStateStatusX on SwapAdvStateStatus{
  bool get isInitial => this == SwapAdvStateStatus.INITIAL;
  bool get isSuccess => this == SwapAdvStateStatus.SUCCESS;
  bool get isError => this == SwapAdvStateStatus.ERROR;
  bool get isLoading => this == SwapAdvStateStatus.LOADING;
  bool get isLoadingMore => this == SwapAdvStateStatus.LOADINGMORE;
  bool get isNull => this == SwapAdvStateStatus.NULL;
}

class SwapAdvState extends Equatable {
  final SwapAdvStateStatus swapAdvStateStatus;
  final List<SwapAdvItem> swapAdvListData;


  const SwapAdvState({
    this.swapAdvStateStatus = SwapAdvStateStatus.INITIAL,
    this.swapAdvListData = const[],

  });

  SwapAdvState copyWith({
    SwapAdvStateStatus? swapAdvStateStatus,
    List<SwapAdvItem>? swapAdvListData,

  }) {
    return SwapAdvState(
      swapAdvStateStatus: swapAdvStateStatus ?? this.swapAdvStateStatus,
      swapAdvListData: swapAdvListData ?? this.swapAdvListData,


    );
  }

  @override
  List<Object?> get props => [
    swapAdvStateStatus,
    swapAdvListData,

  ];
}


