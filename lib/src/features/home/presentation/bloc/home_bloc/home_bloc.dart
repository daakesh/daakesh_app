import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SwapHomeScreenStateEvent>(_swapHomeScreenState);
    on<GetAdvertisementDataEvent>(_getAdvertisementData);
    on<SetFilterDataEvent>(_setFilterDataEvent);
    on<SelectProductPropertiesEvent>(_selectProductProperties);
    on<GetSectionDataEvent>(_getSectionData);
    on<DetermentTodayDealEvent>(_determentTodayDeal);
  }
  static HomeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to swap between home screen states with widget like:
  /// [HomeDataWidget],[SearchScreen],[ResultsScreen],[CartScreen],[MoreInfoProductScreen]
  FutureOr<void> _swapHomeScreenState(SwapHomeScreenStateEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeScreenState: event.homeScreenState));
  }
  ///Event to get ADV data to display it into slider at [HomeDataWidget]
  FutureOr<void> _getAdvertisementData(GetAdvertisementDataEvent event, Emitter<HomeState> emit) async{
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getAdvertisementData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      AdvModel advModel =AdvModel.fromJson(r.data);

      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,advListData: advModel.data!.toList()));
    });
  }
  ///Event to get Categories data at [HomeDataWidget]
  FutureOr<void> _getSectionData(GetSectionDataEvent event, Emitter<HomeState> emit)async{
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getSectionData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SectionModel sectionModel = SectionModel.fromJson(r.data);
      List<SectionItemModel> sectionListData = sectionModel.data!.data!.toList();
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,sectionListData:sectionListData));
    });
  }
  ///Event to insert [FilterScreen] data.
  FutureOr<void> _setFilterDataEvent(SetFilterDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      rateIndex: event.rateTypeIndex,
      productTypeIndex: event.productTypeIndex,
    ));
  }
  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(SelectProductPropertiesEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex:event.productSizeIndex,
    ));
  }

  ///In [HomeDataWidget], Specify today deal is [DaakeshTodayDealProduct] or [TodayDealProduct]
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(DetermentTodayDealEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
  }




}
