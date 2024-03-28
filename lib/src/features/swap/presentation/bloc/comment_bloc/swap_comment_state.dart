import 'package:equatable/equatable.dart';

enum SwapCommentStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension SwapCommentStateStatusX on SwapCommentStateStatus{
  bool get isInitial => this == SwapCommentStateStatus.INITIAL;
  bool get isSuccess => this == SwapCommentStateStatus.SUCCESS;
  bool get isError => this == SwapCommentStateStatus.ERROR;
  bool get isLoading => this == SwapCommentStateStatus.LOADING;
  bool get isLoadingMore => this == SwapCommentStateStatus.LOADINGMORE;
  bool get isNull => this == SwapCommentStateStatus.NULL;
}

class SwapCommentState extends Equatable {
  final SwapCommentStateStatus swapCommentStateStatus;


  const SwapCommentState({
    this.swapCommentStateStatus = SwapCommentStateStatus.INITIAL,

  });

  SwapCommentState copyWith({
    SwapCommentStateStatus? swapCommentStateStatus,

  }) {
    return SwapCommentState(
      swapCommentStateStatus: swapCommentStateStatus ?? this.swapCommentStateStatus,


    );
  }

  @override
  List<Object?> get props => [
    swapCommentStateStatus,
  ];
}


