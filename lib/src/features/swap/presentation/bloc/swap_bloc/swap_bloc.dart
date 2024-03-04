import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';
import '../../../swap.export.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc() : super(const SwapState()) {
    on<ToggleSwapScreenStateEvent>(_swapHomeScreenState);
    on<SwapGetToTopScreenEvent>(_getToTopScreen);
    on<SwapSetFilterDataEvent>(_setFilterDataEvent);
    on<SwapSelectProductPropertiesEvent>(_selectProductProperties);
    on<SwapGetSectionDataEvent>(_getSectionData);
    on<SwapDetermentTodayDealEvent>(_determentTodayDeal);
  }
  static SwapBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  static ScrollController scrollController = ScrollController();
  FutureOr<void> _getToTopScreen(SwapGetToTopScreenEvent event, Emitter<SwapState> emit) {
    scrollController.animateTo(0.0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
  ///Event to swap between home screen states with widget like:
  /// [],[],[],[],[]
  FutureOr<void> _swapHomeScreenState(ToggleSwapScreenStateEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(swapScreenState: event.swapScreenState));
  }
  ///Event to get Categories data at []
  FutureOr<void> _getSectionData(SwapGetSectionDataEvent event, Emitter<SwapState> emit)async{
    emit(state.copyWith(swapStateStatus:  SwapStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().getSectionData();
    result.fold((l) {
      emit(state.copyWith(swapStateStatus: SwapStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SwapSectionModel sectionModel = SwapSectionModel.fromJson(r.data);
      List<SwapSectionItemModel> swapSectionListData = sectionModel.data!.data!.toList();
      emit(state.copyWith(swapStateStatus: SwapStateStatus.SUCCESS,swapSectionListData:swapSectionListData));
    });
  }
  ///Event to insert [] data.
  FutureOr<void> _setFilterDataEvent(SwapSetFilterDataEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(
      rateIndex: event.rateTypeIndex,
      productTypeIndex: event.productTypeIndex,
    ));
  }
  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(SwapSelectProductPropertiesEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex:event.productSizeIndex,
    ));
  }
  ///In [], Specify today deal is [] or []
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(SwapDetermentTodayDealEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
  }


}
