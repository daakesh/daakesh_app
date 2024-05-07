import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SwapSearchStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension SwapSearchStateStatusX on SwapSearchStateStatus {
  bool get isInitial => this == SwapSearchStateStatus.INITIAL;
  bool get isSuccess => this == SwapSearchStateStatus.SUCCESS;
  bool get isError => this == SwapSearchStateStatus.ERROR;
  bool get isLoading => this == SwapSearchStateStatus.LOADING;
  bool get isLoadingMore => this == SwapSearchStateStatus.LOADINGMORE;
  bool get isNull => this == SwapSearchStateStatus.NULL;
}

class SwapSearchState extends Equatable {
  final SwapSearchStateStatus swapSearchStateStatus;
  final List<TrendDealsItem> swapSearchResultList;
  final int currentSearchPage;
  final String searchValue;
  final bool isMoreData;

  const SwapSearchState({
    this.swapSearchStateStatus = SwapSearchStateStatus.INITIAL,
    this.swapSearchResultList = const [],
    this.currentSearchPage = 1,
    this.searchValue = '',
    this.isMoreData = true,
  });

  SwapSearchState copyWith({
    SwapSearchStateStatus? swapSearchStateStatus,
    List<TrendDealsItem>? swapSearchResultList,
    int? currentSearchPage,
    String? searchValue,
    bool? isMoreData,
  }) {
    return SwapSearchState(
      swapSearchStateStatus:
          swapSearchStateStatus ?? this.swapSearchStateStatus,
      swapSearchResultList: swapSearchResultList ?? this.swapSearchResultList,
      currentSearchPage: currentSearchPage ?? this.currentSearchPage,
      searchValue: searchValue ?? this.searchValue,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        swapSearchStateStatus,
        swapSearchResultList,
        currentSearchPage,
        searchValue,
        isMoreData,
      ];
}
