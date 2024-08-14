import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapProStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension SwapProStateStatusX on SwapProStateStatus {
  bool get isInitial => this == SwapProStateStatus.INITIAL;
  bool get isSuccess => this == SwapProStateStatus.SUCCESS;
  bool get isError => this == SwapProStateStatus.ERROR;
  bool get isLoading => this == SwapProStateStatus.LOADING;
  bool get isLoadingMore => this == SwapProStateStatus.LOADINGMORE;
  bool get isNull => this == SwapProStateStatus.NULL;
}

class SwapProState extends Equatable {
  final SwapProStateStatus swapProStateStatus;
  final List<MyProductItem> mySwapProductListData;
  final int currentPage;
  final bool isMoreData;

  const SwapProState({
    this.swapProStateStatus = SwapProStateStatus.INITIAL,
    this.mySwapProductListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  SwapProState copyWith({
    SwapProStateStatus? swapProStateStatus,
    List<MyProductItem>? mySwapProductListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return SwapProState(
      swapProStateStatus: swapProStateStatus ?? this.swapProStateStatus,
      mySwapProductListData:
          mySwapProductListData ?? this.mySwapProductListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        swapProStateStatus,
        mySwapProductListData,
        currentPage,
        isMoreData,
      ];
}
