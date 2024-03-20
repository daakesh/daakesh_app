import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapPassDataBloc extends Bloc<SwapPassDataEvent, SwapPassDataState> {
  SwapPassDataBloc() : super(const SwapPassDataState()) {
    on<PassTrendingDealDataEvent>(_passTrendingDealData);
    on<ChangeProductSliderIndex>(_changeProductSliderIndex);
    on<SwapPassSectionSubCategoriesEvent>(_passSectionSubCategories);
    on<SwapPreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
    on<SwapZoomInOutEvent>(_zoomInOut);
  }
  static SwapPassDataBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  FutureOr<void> _passTrendingDealData(PassTrendingDealDataEvent event, Emitter<SwapPassDataState> emit) {
    List<TrendDealsItem> trendDealsListData =<TrendDealsItem>[];
    trendDealsListData.add(event.trendDealsItem);
    emit(state.copyWith(trendDealsListData:trendDealsListData));
  }
  FutureOr<void> _changeProductSliderIndex(ChangeProductSliderIndex event, Emitter<SwapPassDataState> emit) {
    emit(state.copyWith(sliderIndex:event.sliderIndex));
  }

  FutureOr<void> _passSectionSubCategories(SwapPassSectionSubCategoriesEvent event, Emitter<SwapPassDataState> emit){
    emit(state.copyWith(swapCategoriesListData: event.swapCategoriesListData));
  }
  FutureOr<void> _previewSectionSubCategories(SwapPreviewSectionSubCategoriesEvent event, Emitter<SwapPassDataState> emit) {
    List<SwapSubCategory> swapSubCategoryListData = <SwapSubCategory>[];
    swapSubCategoryListData = state.swapCategoriesListData.elementAt(event.index).swapSubCategoryList!.toList();
    emit(state.copyWith(swapSubCategoryListData: swapSubCategoryListData));
  }
  FutureOr<void> _zoomInOut(SwapZoomInOutEvent event, Emitter<SwapPassDataState> emit) {
    double scale = state.scale;
    if(scale == 3){
      scale = 0;
    }
    scale++;
    emit(state.copyWith(scale:scale));
  }

}
