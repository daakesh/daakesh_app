import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSearchBloc extends Bloc<SwapSearchEvent, SwapSearchState> {
  SwapSearchBloc() : super(const SwapSearchState()) {
    on<SwapSearchOnItemsEvent>(_searchOnItems);
    on<SwapEmptySearchEvent>(_emptySearch);
  }

  static SwapSearchBloc get get => BlocProvider.of(Utils.currentContext);

  ///Action to search on items.
  FutureOr<void> _searchOnItems(
      SwapSearchOnItemsEvent event, Emitter<SwapSearchState> emit) async {
    emit(state.copyWith(
      searchValue: event.searchValue,
    ));
    if (event.isSeeMore) {
      emit(state.copyWith(
          currentSearchPage: state.currentSearchPage + 1,
          swapSearchStateStatus: SwapSearchStateStatus.LOADINGMORE));
    } else {
      emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.LOADING,
          currentSearchPage: 1));
    }
    final result = await getIt.get<SwapUseCases>().searchOnItems(
        event.searchValue.toString(), state.currentSearchPage, 1);
    result.fold((l) {
      emit(state.copyWith(swapSearchStateStatus: SwapSearchStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TrendDealsModel searchModel = TrendDealsModel.fromJson(r.data);
      int lastPage = searchModel.data!.lastPage!;
      List<TrendDealsItem> newResultList =
          searchModel.data!.trendDealsData!.toList();
      List<TrendDealsItem> swapSearchResultList =
          state.swapSearchResultList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapSearchStateStatus: SwapSearchStateStatus.NULL,
          swapSearchResultList: swapSearchResultList,
          isMoreData: lastPage == state.currentSearchPage,
        ));
        return;
      }
      swapSearchResultList.addAll(newResultList);

      emit(state.copyWith(
        swapSearchStateStatus: SwapSearchStateStatus.SUCCESS,
        swapSearchResultList: swapSearchResultList,
        isMoreData: lastPage == state.currentSearchPage,
      ));
    });
  }

  FutureOr<void> _emptySearch(
      SwapEmptySearchEvent event, Emitter<SwapSearchState> emit) {
    emit(state.copyWith(
        swapSearchStateStatus: SwapSearchStateStatus.SUCCESS,
        swapSearchResultList: [],
        searchValue: '',
        currentSearchPage: 1,
        isMoreData: true));
  }
}
