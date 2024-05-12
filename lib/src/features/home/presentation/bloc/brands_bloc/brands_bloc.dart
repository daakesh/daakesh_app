import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  BrandsBloc() : super(const BrandsState()) {
    on<GetBrandsDataEvent>(_getBrandsData);
    on<GetItemsByBrandsEvent>(_getItemsByBrands);
    on<ResetValueEvent>(_resetValue);
    on<SetBrandFilterData>(_setFilterData);
    on<GetBrandsCitiesEvent>(_getBrandsCities);
  }
  static BrandsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getBrandsData(
      GetBrandsDataEvent event, Emitter<BrandsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        brandsStateStatus: BrandsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.LOADING,
        brandListData: [],
        currentPage: 1,
      ));
    }

    final result =
        await getIt.get<HomeUseCases>().getBrandsData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      BrandModel brandModel = BrandModel.fromJson(r.data);
      int lastPage = brandModel.data!.lastPage!;
      List<BrandItem> newResultList = brandModel.data!.brandItemList!.toList();
      List<BrandItem> brandListData = state.brandListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      brandListData.addAll(newResultList);
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.SUCCESS,
        brandListData: brandListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _getItemsByBrands(
      GetItemsByBrandsEvent event, Emitter<BrandsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        brandsStateStatus: BrandsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.LOADING,
          brandID: event.brandID,
          isMoreDataItems: true,
          isFilterActive: event.isFilterActive,
          itemByBrandList: [],
          itemsCurrentPage: 1));
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

    final result = await getIt.get<HomeUseCases>().getItemsByBrandID(
        state.brandID, filterDataModel, state.itemsCurrentPage);
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel brandModel = TodayItemModel.fromJson(r.data);
      int lastPage = brandModel.data!.lastPage!;
      List<TodayItem> newResultList = brandModel.data!.todayItemList!.toList();
      List<TodayItem> itemByBrandList = state.itemByBrandList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.NULL,
          isMoreDataItems: lastPage == state.itemsCurrentPage,
        ));
        return;
      }
      itemByBrandList.addAll(newResultList);
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.SUCCESS,
        itemByBrandList: itemByBrandList,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _setFilterData(
      SetBrandFilterData event, Emitter<BrandsState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _resetValue(ResetValueEvent event, Emitter<BrandsState> emit) {
    emit(state.copyWith(
      itemByBrandList: [],
      isMoreDataItems: true,
      country: "Jordan",
      city: "Amman",
      rate: 0,
      fromPrice: 0.0,
      toPrice: 500.0,
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _getBrandsCities(
      GetBrandsCitiesEvent event, Emitter<BrandsState> emit) async {
    emit(state.copyWith(brandsStateStatus: BrandsStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
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
}
