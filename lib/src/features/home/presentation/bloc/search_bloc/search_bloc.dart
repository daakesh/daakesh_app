import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchOnItemsEvent>(_searchOnItems);
    on<EmptySearchEvent>(_emptySearch);
  }
  static SearchBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  ///Action to search on items.
  FutureOr<void> _searchOnItems(
      SearchOnItemsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
      searchValue: event.searchValue,
    ));
    if (event.isSeeMore) {
      emit(state.copyWith(
          currentSearchPage: state.currentSearchPage + 1,
          searchStateStatus: SearchStateStatus.LOADINGMORE));
    } else {
      emit(state.copyWith(
          searchStateStatus: SearchStateStatus.LOADING, currentSearchPage: 1));
    }
    final result = await getIt.get<HomeUseCases>().searchOnItems(
        event.searchValue.toString(), state.currentSearchPage, 1);
    result.fold((l) {
      emit(state.copyWith(searchStateStatus: SearchStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SearchModel searchModel = SearchModel.fromJson(r.data);
      int lastPage = searchModel.data!.lastPage!;
      List<SearchResultModel> newResultList = searchModel.data!.data!.toList();
      List<SearchResultModel> searchResultList =
          state.searchResultList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          searchStateStatus: SearchStateStatus.NULL,
          searchResultList: searchResultList,
          isMoreData: lastPage == state.currentSearchPage,
        ));
        return;
      }
      searchResultList.addAll(newResultList);

      emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        searchResultList: searchResultList,
        isMoreData: lastPage == state.currentSearchPage,
      ));
    });
  }

  FutureOr<void> _emptySearch(
      EmptySearchEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
        searchStateStatus: SearchStateStatus.SUCCESS,
        searchResultList: [],
        searchValue: '',
        currentSearchPage: 1,
        isMoreData: true));
  }
}
