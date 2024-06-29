import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapPassDataBloc extends Bloc<SwapPassDataEvent, SwapPassDataState> {
  SwapPassDataBloc() : super(const SwapPassDataState()) {
    on<PassTrendingDealDataEvent>(_passTrendingDealData);
    on<ChangeProductSliderIndex>(_changeProductSliderIndex);
    on<SwapZoomInOutEvent>(_zoomInOut);
    on<PassMySwapProductDataEvent>(_passMySwapProductData);
    on<PassSwapCommentEvent>(_passSwapComment);
    on<PassMySwapProductListEvent>(_passMySwapProductList);
    on<ResetSwapPassValuesEvent>(_resetSwapPassValues);
  }
  static SwapPassDataBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _passTrendingDealData(
      PassTrendingDealDataEvent event, Emitter<SwapPassDataState> emit) {
    List<TrendDealsItem> trendDealsListData = <TrendDealsItem>[];
    trendDealsListData.add(event.trendDealsItem);
    emit(state.copyWith(trendDealsListData: trendDealsListData));
  }

  FutureOr<void> _changeProductSliderIndex(
      ChangeProductSliderIndex event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(sliderIndex: event.sliderIndex));
  }

  FutureOr<void> _zoomInOut(
      SwapZoomInOutEvent event, Emitter<SwapPassDataState> emit) {
    double scale = state.scale;
    if (scale == 3) {
      scale = 0;
    }
    scale++;
    emit(state.copyWith(scale: scale));
  }

  FutureOr<void> _passMySwapProductData(
      PassMySwapProductDataEvent event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(itemIndex: event.index));

    List<MyProductItem> mySwapProductData = state.mySwapProductData.toList();
    List<MyProductItem> itemSelected = <MyProductItem>[];
    MyProductItem item = mySwapProductData.elementAt(state.itemIndex);
    itemSelected.add(item);
    emit(
        state.copyWith(itemSelected: itemSelected, itemIndex: state.itemIndex));
  }

  FutureOr<void> _passSwapComment(
      PassSwapCommentEvent event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(comment: event.comment));
  }

  FutureOr<void> _passMySwapProductList(
      PassMySwapProductListEvent event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(mySwapProductData: event.mySwapProductData));
  }

  FutureOr<void> _resetSwapPassValues(
      ResetSwapPassValuesEvent event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(itemIndex: 0));
  }
}
