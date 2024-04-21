import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<SetFilterDataEvent>(_setFilterData);
    on<ClearFilterDataEvent>(_clearFilterData);
    on<PreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
  }
  static FilterBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _clearFilterData(
      ClearFilterDataEvent event, Emitter<FilterState> emit) {
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
      SetFilterDataEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _previewSectionSubCategories(
      PreviewSectionSubCategoriesEvent event, Emitter<FilterState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        filterStateStatus: FilterStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          filterStateStatus: FilterStateStatus.LOADING,
          catID: event.catID,
          isMoreData: true,
          isFilterActive: event.isFilterActive,
          subCategoryListData: [],
          currentPage: 1));
    }
    FilterDataModel filterDataModel = FilterDataModel();
    if (state.isFilterActive) {
      filterDataModel
        ..type = state.type.name
        ..fromPrice = '${state.fromPrice.toInt()}'
        ..toPrice = '${state.toPrice.toInt()}'
        ..country = state.country
        ..city = state.city
        ..rate = '${state.rate}';
    }

    final result = await getIt
        .get<HomeUseCases>()
        .getSubCategoryByCatID(state.catID, filterDataModel, state.currentPage);
    result.fold((l) {
      emit(state.copyWith(filterStateStatus: FilterStateStatus.ERROR));
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
          filterStateStatus: FilterStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      subCategoryListData.addAll(newResultList);
      emit(state.copyWith(
        filterStateStatus: FilterStateStatus.SUCCESS,
        subCategoryListData: subCategoryListData,
        isMoreData: lastPage == state.currentPage,
      ));

      emit(state.copyWith(subCategoryListData: subCategoryListData));
    });
  }
}
