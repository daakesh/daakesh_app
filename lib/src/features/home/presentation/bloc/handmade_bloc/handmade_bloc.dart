import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HandmadeBloc extends Bloc<HandmadeEvent, HandmadeState> {
  HandmadeBloc() : super(const HandmadeState()) {
    on<GetHandmadeDataEvent>(_getHandmadeData);
    on<GetItemsByHomemadeEvent>(_getHandmadeItem);
    on<ResetHandmadeValueEvent>(_resetHandmadeValue);
    on<SetHandmadeFilterDataEvent>(_setFilterData);
    on<ClearHandmadeFilterDataEvent>(_clearHandmadeFilterData);
    on<GetHandmadeCitiesEvent>(_getHandmadeCities);
    on<UpdateHandMadeItemEvent>(_updateHandMadeItem);
  }
  static HandmadeBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _clearHandmadeFilterData(
      ClearHandmadeFilterDataEvent event, Emitter<HandmadeState> emit) {
    emit(state.copyWith(
      country: "Jordan",
      city: "Amman",
      rate: 0,
      fromPrice: 0.0,
      toPrice: 500.0,
      sortingType: SortingType.desc,
      isFilterActive: false,
      type: FilterProductType.All,
    ));
  }

  FutureOr<void> _setFilterData(
      SetHandmadeFilterDataEvent event, Emitter<HandmadeState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getHandmadeData(
      GetHandmadeDataEvent event, Emitter<HandmadeState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        handmadeStateStatus: HandmadeStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.LOADING,
        handmadeListData: [],
        sortingType: event.sortingType,
        isFilterActive: event.isFilterActive,
        currentPage: 1,
      ));
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
        .getHandmadeData(filterDataModel, state.currentPage, state.sortingType);
    result.fold((l) {
      emit(state.copyWith(handmadeStateStatus: HandmadeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      int lastPage = todayItemModel.data!.lastPage!;
      List<TodayItem> newResultList =
          todayItemModel.data!.todayItemList!.toList();
      List<TodayItem> handmadeListData = state.handmadeListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          handmadeStateStatus: HandmadeStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      handmadeListData.addAll(newResultList);
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.SUCCESS,
        handmadeListData: handmadeListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _getHandmadeItem(
      GetItemsByHomemadeEvent event, Emitter<HandmadeState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        handmadeStateStatus: HandmadeStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.LOADING,
        itemByHandmadeList: [],
        homemadeID: event.homemadeID,
        itemsCurrentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(handmadeStateStatus: HandmadeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      int lastPage = todayItemModel.data!.lastPage!;
      List<TodayItem> newResultList =
          todayItemModel.data!.todayItemList!.toList();
      List<TodayItem> todayItemData = state.itemByHandmadeList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          handmadeStateStatus: HandmadeStateStatus.NULL,
          isMoreDataItems: lastPage == state.currentPage,
        ));
        return;
      }
      todayItemData.addAll(newResultList);
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.SUCCESS,
        itemByHandmadeList: todayItemData,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _getHandmadeCities(
      GetHandmadeCitiesEvent event, Emitter<HandmadeState> emit) async {
    emit(state.copyWith(handmadeStateStatus: HandmadeStateStatus.CITYLOADING));
    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(handmadeStateStatus: HandmadeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      CitiesModel citiesModel = CitiesModel.fromJson(r.data);
      List<CityItem> cityItemList = citiesModel.data!.toList();
      emit(state.copyWith(
          handmadeStateStatus: HandmadeStateStatus.SUCCESS,
          cityItemList: cityItemList));
    });
  }

  FutureOr<void> _resetHandmadeValue(
      ResetHandmadeValueEvent event, Emitter<HandmadeState> emit) {
    emit(state.copyWith(
      itemByHandmadeList: [],
      isMoreDataItems: true,
    ));
  }

  FutureOr<void> _updateHandMadeItem(
      UpdateHandMadeItemEvent event, Emitter<HandmadeState> emit) async {
    List<TodayItem> updatedTodayDealList = List.from(state.handmadeListData);
    int index =
        updatedTodayDealList.indexWhere((element) => element.id == event.id);

    if (index != -1) {
      updatedTodayDealList[index] = updatedTodayDealList[index]
          .copyWith(averageRating: event.avgRating, rateCount: event.rateCount);
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.SUCCESS,
        handmadeListData: updatedTodayDealList,
      ));
    }
  }
}
