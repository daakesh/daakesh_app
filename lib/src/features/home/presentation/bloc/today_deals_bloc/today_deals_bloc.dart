import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class TodayDealsBloc extends Bloc<TodayDealsEvent, TodayDealsState> {
  TodayDealsBloc() : super(const TodayDealsState()) {
    on<GetToadyDealsDataEvent>(_getTodayDealsData);
    on<GetToadyDaakeshDealsDataEvent>(_getToadyDaakeshDealsData);
    on<GetViewAllItemsEvent>(_getViewAllItems);
    on<ResetViewAllEvent>(_resetViewAll);
    on<SetViewAllFilterEvent>(_setViewAllFilter);
    on<GetViewAllCitiesEvent>(_getViewAllCities);
  }

  static TodayDealsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getTodayDealsData(
      GetToadyDealsDataEvent event, Emitter<TodayDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        todayDealsStateStatus: TodayDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.LOADING,
        todayDealsListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getTodayItemsData(
        FilterDataModel(),
        HomeTodayItemType.Sell,
        state.currentPage,
        SortingType.desc);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
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
      List<TodayItem> todayDealsListData = state.todayDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      todayDealsListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        todayDealsListData: todayDealsListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _getToadyDaakeshDealsData(GetToadyDaakeshDealsDataEvent event,
      Emitter<TodayDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        daakeshCurrentPage: state.daakeshCurrentPage + 1,
        todayDealsStateStatus: TodayDealsStateStatus.DAAKESHLOADING,
      ));
    } else {
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.DAAKESHLOADING,
        daakeshTodayDealsListData: [],
        daakeshCurrentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getTodayItemsData(
        FilterDataModel(),
        HomeTodayItemType.Daakesh,
        state.daakeshCurrentPage,
        SortingType.desc);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
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
      List<TodayItem> daakeshTodayDealsListData =
          state.daakeshTodayDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.DAAKESHNULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      daakeshTodayDealsListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        daakeshTodayDealsListData: daakeshTodayDealsListData,
        isMoreDaakeshData: lastPage == state.daakeshCurrentPage,
      ));
    });
  }

  FutureOr<void> _getViewAllItems(
      GetViewAllItemsEvent event, Emitter<TodayDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        todayDealsStateStatus: TodayDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.LOADING,
          isMoreDataItems: true,
          isFilterActive: event.isFilterActive,
          sortingType: event.sortingType,
          allTodayDealsListData: [],
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

    final result = await getIt.get<HomeUseCases>().getTodayItemsData(
        filterDataModel,
        HomeTodayItemType.Daakesh,
        state.itemsCurrentPage,
        state.sortingType);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
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
      List<TodayItem> todayDealListData = state.allTodayDealsListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.NULL,
          isMoreDataItems: lastPage == state.itemsCurrentPage,
        ));
        return;
      }
      todayDealListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        allTodayDealsListData: todayDealListData,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _resetViewAll(
      ResetViewAllEvent event, Emitter<TodayDealsState> emit) {
    emit(state.copyWith(
      allTodayDealsListData: [],
      todayDealsListData: [],
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

  FutureOr<void> _setViewAllFilter(
      SetViewAllFilterEvent event, Emitter<TodayDealsState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _getViewAllCities(
      GetViewAllCitiesEvent event, Emitter<TodayDealsState> emit) async {
    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
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
