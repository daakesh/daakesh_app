import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapFilterBloc extends Bloc<SwapFilterEvent, SwapFilterState> {
  SwapFilterBloc() : super(const SwapFilterState()) {
    on<SwapSetFilterDataEvent>(_setFilterData);
    on<SwapClearFilterDataEvent>(_clearFilterData);
    on<SwapPreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
  }
  static SwapFilterBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _clearFilterData(
      SwapClearFilterDataEvent event, Emitter<SwapFilterState> emit) {
    emit(state.copyWith(
      country: "Jordan",
      city: "Amman",
      rate: 0,
      fromPrice: 0.0,
      toPrice: 500.0,
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _setFilterData(
      SwapSetFilterDataEvent event, Emitter<SwapFilterState> emit) {
    emit(state.copyWith(
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _previewSectionSubCategories(
      SwapPreviewSectionSubCategoriesEvent event,
      Emitter<SwapFilterState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        filterStateStatus: SwapFilterStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          filterStateStatus: SwapFilterStateStatus.LOADING,
          catID: event.catID,
          isMoreData: true,
          isFilterActive: event.isFilterActive,
          subCategoryListData: [],
          currentPage: 1));
    }
    SwapFilterDataModel swapFilterDataModel = SwapFilterDataModel();
    if (state.isFilterActive) {
      swapFilterDataModel
        ..type = state.type.name
        ..fromPrice = '${state.fromPrice.toInt()}'
        ..toPrice = '${state.toPrice.toInt()}'
        ..country = state.country
        ..city = state.city
        ..rate = '${state.rate}';
    }
    final result = await getIt.get<SwapUseCases>().getSubCategoryByCatID(
        state.catID, swapFilterDataModel, state.currentPage);
    result.fold((l) {
      emit(state.copyWith(filterStateStatus: SwapFilterStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      FilterModel filterModel =
          FilterModel.fromJson(r.data as Map<String, dynamic>);
      List<FilterResultModel> newResultList = filterModel.data!.data!.toList();
      int lastPage = filterModel.data!.lastPage!;
      List<FilterResultModel> subCategoryListData =
          state.subCategoryListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          filterStateStatus: SwapFilterStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      subCategoryListData.addAll(newResultList);
      emit(state.copyWith(
        filterStateStatus: SwapFilterStateStatus.SUCCESS,
        subCategoryListData: subCategoryListData,
        isMoreData: lastPage == state.currentPage,
      ));
      emit(state.copyWith(subCategoryListData: subCategoryListData));
    });
  }
}
