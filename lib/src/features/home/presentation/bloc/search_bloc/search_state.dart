import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum SearchStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension SearchStateStatusX on SearchStateStatus {
  bool get isInitial => this == SearchStateStatus.INITIAL;
  bool get isSuccess => this == SearchStateStatus.SUCCESS;
  bool get isError => this == SearchStateStatus.ERROR;
  bool get isLoading => this == SearchStateStatus.LOADING;
  bool get isLoadingMore => this == SearchStateStatus.LOADINGMORE;
  bool get isNull => this == SearchStateStatus.NULL;
}

class SearchState extends Equatable {
  final SearchStateStatus searchStateStatus;
  final List<TodayItem> searchResultList;
  final int currentSearchPage;
  final String searchValue;
  final bool isMoreData;

  const SearchState({
    this.searchStateStatus = SearchStateStatus.INITIAL,
    this.searchResultList = const [],
    this.currentSearchPage = 1,
    this.searchValue = '',
    this.isMoreData = true,
  });

  SearchState copyWith({
    SearchStateStatus? searchStateStatus,
    List<TodayItem>? searchResultList,
    int? currentSearchPage,
    String? searchValue,
    bool? isMoreData,
  }) {
    return SearchState(
      searchStateStatus: searchStateStatus ?? this.searchStateStatus,
      searchResultList: searchResultList ?? this.searchResultList,
      currentSearchPage: currentSearchPage ?? this.currentSearchPage,
      searchValue: searchValue ?? this.searchValue,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        searchStateStatus,
        searchResultList,
        currentSearchPage,
        searchValue,
        isMoreData,
      ];
}
