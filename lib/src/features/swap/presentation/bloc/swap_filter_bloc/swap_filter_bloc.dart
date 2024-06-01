import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapFilterBloc extends Bloc<SwapFilterEvent, SwapFilterState> {
  SwapFilterBloc() : super(const SwapFilterState()) {
    on<SwapSetFilterDataEvent>(_setFilterData);
    on<SwapClearFilterDataEvent>(_clearFilterData);
    on<SwapPreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
    on<SwapSelectCategoryItemEvent>(_swapSelectCategoryItem);
    on<GetSwapCitiesEvent>(_getSwapCities);
    on<GetSwapSubCategoriesEvent>(_getSwapSubCategories);
  }
  static SwapFilterBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _clearFilterData(
      SwapClearFilterDataEvent event, Emitter<SwapFilterState> emit) {
    emit(state.copyWith(
      country: "Jordan",
      city: "Amman",
      rate: 0,
      isAllItems: true,
      fromPrice: 0.0,
      toPrice: 500.0,
      subCategoryList: [],
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _setFilterData(
      SwapSetFilterDataEvent event, Emitter<SwapFilterState> emit) {
    emit(state.copyWith(
      city: event.city,
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
        swapFilterStateStatus: SwapFilterStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          swapFilterStateStatus: SwapFilterStateStatus.LOADING,
          catID: event.catID,
          isMoreData: true,
          isAllItems: event.isAllItems,
          sortingType: event.sortingType,
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
    final result = state.isAllItems
        ? await getIt.get<SwapUseCases>().getSubCategoryByCatID(state.catID,
            swapFilterDataModel, state.currentPage, state.sortingType)
        : await getIt.get<SwapUseCases>().getItemsBySubCategoriesID(state.catID,
            swapFilterDataModel, state.currentPage, state.sortingType);
    result.fold((l) {
      emit(state.copyWith(swapFilterStateStatus: SwapFilterStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TrendDealsModel filterModel =
          TrendDealsModel.fromJson(r.data as Map<String, dynamic>);
      List<TrendDealsItem> newResultList =
          filterModel.data!.trendDealsData!.toList();
      int lastPage = filterModel.data!.lastPage!;
      List<TrendDealsItem> subCategoryListData =
          state.subCategoryListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapFilterStateStatus: SwapFilterStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      subCategoryListData.addAll(newResultList);
      emit(state.copyWith(
        swapFilterStateStatus: SwapFilterStateStatus.SUCCESS,
        subCategoryListData: subCategoryListData,
        isMoreData: lastPage == state.currentPage,
      ));
      emit(state.copyWith(subCategoryListData: subCategoryListData));
    });
  }

  FutureOr<void> _swapSelectCategoryItem(
      SwapSelectCategoryItemEvent event, Emitter<SwapFilterState> emit) {
    emit(state.copyWith(categoryIndex: event.index));
  }

  FutureOr<void> _getSwapCities(
      GetSwapCitiesEvent event, Emitter<SwapFilterState> emit) async {
    final result = await getIt.get<SwapUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(swapFilterStateStatus: SwapFilterStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      CitiesModel citiesModel = CitiesModel.fromJson(r.data);
      List<CityItem> cityItemList = citiesModel.data!.toList();
      emit(state.copyWith(cityItemList: cityItemList));
    });
  }

  FutureOr<void> _getSwapSubCategories(
      GetSwapSubCategoriesEvent event, Emitter<SwapFilterState> emit) async {
    emit(state.copyWith(swapFilterStateStatus: SwapFilterStateStatus.LOADING));

    final result = await getIt
        .get<SwapUseCases>()
        .getSwapSubCategoiresByCatID(event.catID);
    result.fold((l) {
      emit(state.copyWith(swapFilterStateStatus: SwapFilterStateStatus.ERROR));

      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SubCategoryModel subCategory = SubCategoryModel.fromJson(r.data);
      List<SubCategory> subCategoryList = subCategory.data!.toList();
      emit(state.copyWith(subCategoryList: subCategoryList));
    });
  }
}
