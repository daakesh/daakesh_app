import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class PassDataBloc extends Bloc<PassDataEvent, PassDataState> {
  PassDataBloc() : super(const PassDataState()) {
    on<PassTodayDealDataEvent>(_passTodayDealData);
    on<ZoomInOutEvent>(_zoomInOut);
    on<PassSectionSubCategoriesEvent>(_passSectionSubCategories);
    on<PreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
    on<SelectProductPropertiesEvent>(_selectProductProperties);
    on<DetermentTodayDealEvent>(_determentTodayDeal);
  }
  static PassDataBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

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

  FutureOr<void> _passSectionSubCategories(
      PassSectionSubCategoriesEvent event, Emitter<PassDataState> emit) {
    emit(state.copyWith(categoriesListData: event.categoriesListData));
  }

  FutureOr<void> _previewSectionSubCategories(
      PreviewSectionSubCategoriesEvent event, Emitter<PassDataState> emit) {
    List<SubCategory> subCategoryListData = <SubCategory>[];
    subCategoryListData = state.categoriesListData
        .elementAt(event.index)
        .subCategoryList!
        .toList();
    emit(state.copyWith(subCategoryListData: subCategoryListData));
  }

  FutureOr<void> _zoomInOut(ZoomInOutEvent event, Emitter<PassDataState> emit) {
    double scale = state.scale;
    if (scale == 3) {
      scale = 0;
    }
    scale++;
    emit(state.copyWith(scale: scale));
  }
}
