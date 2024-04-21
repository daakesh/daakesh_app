import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum TodayDealsStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL,
  DAAKESHLOADINGMORE,
  DAAKESHLOADING,
  DAAKESHNULL,
}

extension TodayDealsStateStatusX on TodayDealsStateStatus {
  bool get isInitial => this == TodayDealsStateStatus.INITIAL;
  bool get isSuccess => this == TodayDealsStateStatus.SUCCESS;
  bool get isError => this == TodayDealsStateStatus.ERROR;
  bool get isLoading => this == TodayDealsStateStatus.LOADING;
  bool get isLoadingMore => this == TodayDealsStateStatus.LOADINGMORE;
  bool get isNull => this == TodayDealsStateStatus.NULL;
  bool get isDaakeshLoadingMore =>
      this == TodayDealsStateStatus.DAAKESHLOADINGMORE;
  bool get isDaakeshLoading => this == TodayDealsStateStatus.DAAKESHLOADING;
  bool get isDaakeshNull => this == TodayDealsStateStatus.DAAKESHNULL;
}

class TodayDealsState extends Equatable {
  final TodayDealsStateStatus todayDealsStateStatus;
  final List<TodayItem> todayDealsListData;
  final int currentPage;
  final bool isMoreData;

  ///
  final List<TodayItem> daakeshTodayDealsListData;
  final int daakeshCurrentPage;
  final bool isMoreDaakeshData;

  ///
  final int productSliderIndex;
  final int productSizeIndex;

  ///
  final bool isDaakeshTodayDeal;

  const TodayDealsState({
    this.todayDealsStateStatus = TodayDealsStateStatus.INITIAL,
    this.todayDealsListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,

    ///
    this.daakeshTodayDealsListData = const [],
    this.daakeshCurrentPage = 1,
    this.isMoreDaakeshData = true,

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
    List<TodayItem>? daakeshTodayDealsListData,
    int? daakeshCurrentPage,
    bool? isMoreDaakeshData,

    ///
    int? productSliderIndex,
    int? productSizeIndex,
    bool? isDaakeshTodayDeal,
  }) {
    return TodayDealsState(
      todayDealsStateStatus:
          todayDealsStateStatus ?? this.todayDealsStateStatus,
      todayDealsListData: todayDealsListData ?? this.todayDealsListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,

      ///
      daakeshTodayDealsListData:
          daakeshTodayDealsListData ?? this.daakeshTodayDealsListData,
      daakeshCurrentPage: daakeshCurrentPage ?? this.daakeshCurrentPage,
      isMoreDaakeshData: isMoreDaakeshData ?? this.isMoreDaakeshData,

      ///
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
        ///
        daakeshTodayDealsListData,
        daakeshCurrentPage,
        isMoreDaakeshData,

        ///
        productSliderIndex,
        productSizeIndex,

        ///
        isDaakeshTodayDeal
      ];
}
