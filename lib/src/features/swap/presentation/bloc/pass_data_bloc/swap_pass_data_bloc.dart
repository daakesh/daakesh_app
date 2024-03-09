import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapPassDataBloc extends Bloc<SwapPassDataEvent, SwapPassDataState> {
  SwapPassDataBloc() : super(const SwapPassDataState()) {
    on<SwapPassSectionSubCategoriesEvent>(_passSectionSubCategories);
    on<SwapPreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
  }
  static SwapPassDataBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  FutureOr<void> _passSectionSubCategories(SwapPassSectionSubCategoriesEvent event, Emitter<SwapPassDataState> emit){
    emit(state.copyWith(swapCategoriesListData: event.swapCategoriesListData));
  }

  FutureOr<void> _previewSectionSubCategories(SwapPreviewSectionSubCategoriesEvent event, Emitter<SwapPassDataState> emit) {
    List<SwapSubCategory> swapSubCategoryListData = <SwapSubCategory>[];
    swapSubCategoryListData = state.swapCategoriesListData.elementAt(event.index).swapSubCategoryList!.toList();
    emit(state.copyWith(swapSubCategoryListData: swapSubCategoryListData));
  }

}
