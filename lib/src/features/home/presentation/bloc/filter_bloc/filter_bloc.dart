import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<SetFilterDataEvent>(_setFilterData);
    on<ClearFilterDataEvent>(_clearFilterData);
    on<PreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
    on<SelectCategoryItemEvent>(_selectItem);
    on<GetCitiesEvent>(_getCities);
    on<GetSubCategoriesEvent>(_getSubCategories);
    on<UpdateSubCategoryEvent>(_updateSubCategory);
  }
  static FilterBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _clearFilterData(
      ClearFilterDataEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      country: "Jordan",
      city: "Amman",
      rate: 0,
      isAllItems: true,
      fromPrice: 0.0,
      toPrice: 500.0,
      isFilterActive: false,
      sortingType: SortingType.desc,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _setFilterData(
      SetFilterDataEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      city: event.city,
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
          isAllItems: event.isAllItems,
          isFilterActive: event.isFilterActive,
          sortingType: event.sortingType,
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

    final result = state.isAllItems
        ? await getIt.get<HomeUseCases>().getSubCategoryByCatID(
            state.catID, filterDataModel, state.currentPage, state.sortingType)
        : await getIt.get<HomeUseCases>().getItemBySubCategoryID(
            state.catID, filterDataModel, state.currentPage, state.sortingType);
    result.fold((l) {
      emit(state.copyWith(filterStateStatus: FilterStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      TodayItemModel filterModel =
          TodayItemModel.fromJson(r.data as Map<String, dynamic>);
      List<TodayItem> newResultList = filterModel.data!.todayItemList!.toList();
      int lastPage = filterModel.data!.lastPage!;
      List<TodayItem> subCategoryListData = state.subCategoryListData.toList();

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
    });
  }

  FutureOr<void> _selectItem(
      SelectCategoryItemEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(categoryIndex: event.index));
  }

  FutureOr<void> _getCities(
      GetCitiesEvent event, Emitter<FilterState> emit) async {
    emit(state.copyWith(filterStateStatus: FilterStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(filterStateStatus: FilterStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      CitiesModel citiesModel = CitiesModel.fromJson(r.data);
      List<CityItem> cityItemList = citiesModel.data!.toList();
      emit(state.copyWith(cityItemList: cityItemList));
    });
  }

  FutureOr<void> _getSubCategories(
      GetSubCategoriesEvent event, Emitter<FilterState> emit) async {
    final result =
        await getIt.get<HomeUseCases>().getSubCategories(event.catID);
    result.fold((l) {
      emit(state.copyWith(filterStateStatus: FilterStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      SubCategoryModel subCategory = SubCategoryModel.fromJson(r.data);
      List<SubCategory> subCategoryList = subCategory.data!.toList();
      emit(state.copyWith(subCategoryList: subCategoryList));
    });
  }

  FutureOr<void> _updateSubCategory(
      UpdateSubCategoryEvent event, Emitter<FilterState> emit) {
    List<TodayItem> updatedTodayDealList = List.from(state.subCategoryListData);
    int index =
        updatedTodayDealList.indexWhere((element) => element.id == event.id);

    if (index != -1) {
      updatedTodayDealList[index] = updatedTodayDealList[index]
          .copyWith(averageRating: event.avgRating, rateCount: event.rateCount);
      emit(state.copyWith(
        filterStateStatus: FilterStateStatus.SUCCESS,
        subCategoryListData: updatedTodayDealList,
      ));
    }
  }
}
