import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class PassDataBloc extends Bloc<PassDataEvent, PassDataState> {
  PassDataBloc() : super(const PassDataState()) {
    on<PassSectionSubCategoriesEvent>(_passSectionSubCategories);
    on<PreviewSectionSubCategoriesEvent>(_previewSectionSubCategories);
  }
  static PassDataBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  FutureOr<void> _passSectionSubCategories(PassSectionSubCategoriesEvent event, Emitter<PassDataState> emit){
    emit(state.copyWith(categoriesListData: event.categoriesListData));
  }

  FutureOr<void> _previewSectionSubCategories(PreviewSectionSubCategoriesEvent event, Emitter<PassDataState> emit) {
    List<SubCategory> subCategoryListData = <SubCategory>[];
    subCategoryListData = state.categoriesListData.elementAt(event.index).subCategoryList!.toList();
    emit(state.copyWith(subCategoryListData: subCategoryListData));
  }

}
