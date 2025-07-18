import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  SectionsBloc() : super(const SectionsState()) {
    on<GetCategoryBySectionIDEvent>(_getCategoryBySectionID);
    on<ResetVarEvent>(_resetVarEvent);
    on<SelectItemEvent>(_selectItem);
  }
  static SectionsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get sections categories at [SectionScreen].
  FutureOr<void> _getCategoryBySectionID(
      GetCategoryBySectionIDEvent event, Emitter<SectionsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        sectionsStateStatus: SectionsStateStatus.LOADINGMORE,
      ));
    } else {
      ProgressCircleDialog.show();
      emit(state.copyWith(
        sectionsStateStatus: SectionsStateStatus.LOADING,
        secID: event.secID,
        sectionIndex: event.sectionIndex,
        categoryTitle: event.categoryTitle,
        arCategoryTitle: event.arCategoryTitle,
        categoriesListData: [],
        currentPage: 1,
      ));
    }
    final result = await getIt
        .get<HomeUseCases>()
        .getCategoryBySectionID(state.secID, state.currentPage);
    result.fold((l) {
      emit(state.copyWith(sectionsStateStatus: SectionsStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!event.isSeeMore) {
        ProgressCircleDialog.dismiss();
      }
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      CategoryModel categoryData = CategoryModel.fromJson(r.data);
      int lastPage = categoryData.data!.lastPage!;
      List<CategoryItem> newResultList =
          categoryData.data!.categoryItemList!.toList();
      List<CategoryItem> categoriesListData = state.categoriesListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          sectionsStateStatus: SectionsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      categoriesListData.addAll(newResultList);
      emit(state.copyWith(
        sectionsStateStatus: SectionsStateStatus.SUCCESS,
        categoriesListData: categoriesListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  ///Event to get variables back to initial values at [SectionScreen].
  FutureOr<void> _resetVarEvent(
      ResetVarEvent event, Emitter<SectionsState> emit) {
    emit(state.copyWith(
      sectionsStateStatus: SectionsStateStatus.SUCCESS,
      sectionIndex: -1,
      currentPage: 1,
      isMoreData: true,
      categoriesListData: [],
      secID: -1,
      categoryTitle: '',
    ));
  }

  FutureOr<void> _selectItem(
      SelectItemEvent event, Emitter<SectionsState> emit) {
    int index = event.index;
    emit(state.copyWith(sectionIndex: index));
  }
}
