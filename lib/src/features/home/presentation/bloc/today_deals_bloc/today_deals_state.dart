import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum TodayDealsStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension TodayDealsStateStatusX on TodayDealsStateStatus{
  bool get isInitial => this == TodayDealsStateStatus.INITIAL;
  bool get isSuccess => this == TodayDealsStateStatus.SUCCESS;
  bool get isError => this == TodayDealsStateStatus.ERROR;
  bool get isLoading => this == TodayDealsStateStatus.LOADING;
  bool get isLoadingMore => this == TodayDealsStateStatus.LOADINGMORE;
  bool get isNull => this == TodayDealsStateStatus.NULL;
}

class TodayDealsState extends Equatable {
  final TodayDealsStateStatus todayDealsStateStatus;
  final List<HandmadeItem> todayDealsListData;
  final int currentPage;
  final bool isMoreData;

  const TodayDealsState({
    this.todayDealsStateStatus = TodayDealsStateStatus.INITIAL,
    this.todayDealsListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  TodayDealsState copyWith({
    TodayDealsStateStatus? todayDealsStateStatus,
    List<HandmadeItem>? todayDealsListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return TodayDealsState(
      todayDealsStateStatus: todayDealsStateStatus ?? this.todayDealsStateStatus,
      todayDealsListData: todayDealsListData ?? this.todayDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

    );
  }

  @override
  List<Object?> get props => [
    todayDealsStateStatus,
    todayDealsListData,
    currentPage,
    isMoreData,
  ];
}


