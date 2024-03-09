import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapTodayDealsStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension SwapTodayDealsStateStatusX on SwapTodayDealsStateStatus{
  bool get isInitial => this == SwapTodayDealsStateStatus.INITIAL;
  bool get isSuccess => this == SwapTodayDealsStateStatus.SUCCESS;
  bool get isError => this == SwapTodayDealsStateStatus.ERROR;
  bool get isLoading => this == SwapTodayDealsStateStatus.LOADING;
  bool get isLoadingMore => this == SwapTodayDealsStateStatus.LOADINGMORE;
  bool get isNull => this == SwapTodayDealsStateStatus.NULL;
}

class TrendDealsState extends Equatable {
  final SwapTodayDealsStateStatus swapTodayDealsStateStatus;
  final List<TrendDealsItem> trendDealsListData;
  final int currentPage;
  final bool isMoreData;

  const TrendDealsState({
    this.swapTodayDealsStateStatus = SwapTodayDealsStateStatus.INITIAL,
    this.trendDealsListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  TrendDealsState copyWith({
    SwapTodayDealsStateStatus? swapTodayDealsStateStatus,
    List<TrendDealsItem>? trendDealsListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return TrendDealsState(
      swapTodayDealsStateStatus: swapTodayDealsStateStatus ?? this.swapTodayDealsStateStatus,
      trendDealsListData: trendDealsListData ?? this.trendDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

    );
  }

  @override
  List<Object?> get props => [
    swapTodayDealsStateStatus,
    trendDealsListData,
    currentPage,
    isMoreData,
  ];
}


