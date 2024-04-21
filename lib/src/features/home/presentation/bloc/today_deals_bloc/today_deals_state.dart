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
  final List<TodayItem> todayDealsListData;
  final int currentPage;
  final bool isMoreData;
  ///
  final int productSliderIndex;
  final int productSizeIndex;
  ///
  final bool isDaakeshTodayDeal;


  const TodayDealsState({
    this.todayDealsStateStatus = TodayDealsStateStatus.INITIAL,
    this.todayDealsListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
    ///
    this.productSliderIndex = 0,
    this.productSizeIndex = 0,
    ///
    this.isDaakeshTodayDeal = false,

  });

  TodayDealsState copyWith({
    TodayDealsStateStatus? todayDealsStateStatus,
    List<TodayItem>? todayDealsListData,
    int? currentPage,
    bool? isMoreData,
    ///
    int? productSliderIndex,
    int? productSizeIndex,
    bool? isDaakeshTodayDeal,
  }) {
    return TodayDealsState(
      todayDealsStateStatus: todayDealsStateStatus ?? this.todayDealsStateStatus,
      todayDealsListData: todayDealsListData ?? this.todayDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      productSliderIndex: productSliderIndex ?? this.productSliderIndex,
      productSizeIndex: productSizeIndex ?? this.productSizeIndex,
      ///
      isDaakeshTodayDeal: isDaakeshTodayDeal ?? this.isDaakeshTodayDeal,

    );
  }

  @override
  List<Object?> get props => [
    todayDealsStateStatus,
    todayDealsListData,
    currentPage,
    isMoreData,
    ///
    productSliderIndex,
    productSizeIndex,
    ///
    isDaakeshTodayDeal
  ];
}


