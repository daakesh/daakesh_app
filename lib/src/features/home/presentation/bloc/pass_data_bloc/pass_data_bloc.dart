import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class PassDataBloc extends Bloc<PassDataEvent, PassDataState> {
  PassDataBloc() : super(const PassDataState()) {
    on<PassTodayDealDataEvent>(_passTodayDealData);
    on<ZoomInOutEvent>(_zoomInOut);
    on<SelectProductPropertiesEvent>(_selectProductProperties);
    on<DetermentTodayDealEvent>(_determentTodayDeal);
    on<ProductZoomInOutEvent>(_proZoomInOut);
    on<ResetScaleValueEvent>(_resetScaleValue);
  }
  static PassDataBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _passTodayDealData(
      PassTodayDealDataEvent event, Emitter<PassDataState> emit) {
    List<TodayItem> todayItem = <TodayItem>[];
    todayItem.add(event.todayDealItem);
    emit(state.copyWith(todayItem: todayItem));
  }

  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(
      SelectProductPropertiesEvent event, Emitter<PassDataState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex: event.productSizeIndex,
    ));
  }

  ///In [HomeDataWidget], Specify today deal is [DaakeshTodayDealProduct] or [TodayDealProduct]
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(
      DetermentTodayDealEvent event, Emitter<PassDataState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
  }

  FutureOr<void> _zoomInOut(ZoomInOutEvent event, Emitter<PassDataState> emit) {
    double scale = state.scale;
    if (scale == 3) {
      scale = 0;
    }
    scale++;
    emit(state.copyWith(scale: scale));
  }

  FutureOr<void> _proZoomInOut(
      ProductZoomInOutEvent event, Emitter<PassDataState> emit) {
    double scale = state.productScale;
    if (scale == 3) {
      scale = 0;
    }
    scale++;
    emit(state.copyWith(productScale: scale));
  }

  FutureOr<void> _resetScaleValue(
      ResetScaleValueEvent event, Emitter<PassDataState> emit) {
    emit(state.copyWith(scale: event.scale, productScale: event.productScale));
  }
}
