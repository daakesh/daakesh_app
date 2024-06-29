import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class OfferDealsBloc extends Bloc<OfferDealsEvent, OfferDealsState> {
  OfferDealsBloc() : super(const OfferDealsState()) {
    on<GetAllOfferDealsEvent>(_getAllOfferDeals);
    on<ViewAllOfferDealsItemsEvent>(_viewAllOfferDealsItems);
    on<ResetViewAllOfferDealsEvent>(_resetViewAllOfferDeals);
    on<SetViewAllOfferDealsFilterEvent>(_setViewAllOfferDealsFilter);
    on<GetViewAllOfferDealsCitiesEvent>(_getViewAllOfferDealsCities);
  }
  static OfferDealsBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _getAllOfferDeals(
      GetAllOfferDealsEvent event, Emitter<OfferDealsState> emit) async {
    emit(state.copyWith(offerDealsStateStatus: OfferDealsStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getAllTodayItems(
        FilterDataModel(), state.itemsCurrentPage, SortingType.desc);
    result.fold((l) {
      emit(state.copyWith(offerDealsStateStatus: OfferDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      List<TodayItem> todayDealListData =
          todayItemModel.data!.todayItemList!.toList();
      emit(state.copyWith(
        offerDealsStateStatus: OfferDealsStateStatus.SUCCESS,
        homeTodayDealsListData: todayDealListData,
      ));
    });
  }

  FutureOr<void> _viewAllOfferDealsItems(
      ViewAllOfferDealsItemsEvent event, Emitter<OfferDealsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        offerDealsStateStatus: OfferDealsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
          offerDealsStateStatus: OfferDealsStateStatus.LOADING,
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

    final result = await getIt.get<HomeUseCases>().getAllTodayItems(
        filterDataModel, state.itemsCurrentPage, state.sortingType);
    result.fold((l) {
      emit(state.copyWith(offerDealsStateStatus: OfferDealsStateStatus.ERROR));
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
          offerDealsStateStatus: OfferDealsStateStatus.NULL,
          isMoreDataItems: lastPage == state.itemsCurrentPage,
        ));
        return;
      }
      todayDealListData.addAll(newResultList);
      emit(state.copyWith(
        offerDealsStateStatus: OfferDealsStateStatus.SUCCESS,
        allTodayDealsListData: todayDealListData,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _resetViewAllOfferDeals(
      ResetViewAllOfferDealsEvent event, Emitter<OfferDealsState> emit) {
    emit(state.copyWith(
      allTodayDealsListData: [],
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

  FutureOr<void> _setViewAllOfferDealsFilter(
      SetViewAllOfferDealsFilterEvent event, Emitter<OfferDealsState> emit) {
    emit(state.copyWith(
      city: event.city,
      rate: event.rate,
      fromPrice: event.fromPrice,
      toPrice: event.toPrice,
      type: event.productType,
    ));
  }

  FutureOr<void> _getViewAllOfferDealsCities(
      GetViewAllOfferDealsCitiesEvent event,
      Emitter<OfferDealsState> emit) async {
    final result = await getIt.get<HomeUseCases>().getCities();
    result.fold((l) {
      emit(state.copyWith(offerDealsStateStatus: OfferDealsStateStatus.ERROR));
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
