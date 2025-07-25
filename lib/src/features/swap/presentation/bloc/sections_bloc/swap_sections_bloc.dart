import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapSectionsBloc extends Bloc<SwapSectionsEvent, SwapSectionsState> {
  SwapSectionsBloc() : super(const SwapSectionsState()) {
    on<SwapGetCategoryBySectionIDEvent>(_getCategoryBySectionID);
    on<SwapResetVarEvent>(_resetVarEvent);
    on<SwapSelectItemEvent>(_selectItem);
  }
  static SwapSectionsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get sections categories at [SectionScreen].
  FutureOr<void> _getCategoryBySectionID(SwapGetCategoryBySectionIDEvent event,
      Emitter<SwapSectionsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        swapSectionsStateStatus: SwapSectionsStateStatus.LOADINGMORE,
      ));
    } else {
      ProgressCircleDialog.show();
      emit(state.copyWith(
        swapSectionsStateStatus: SwapSectionsStateStatus.LOADING,
        secID: event.secID,
        sectionIndex: event.sectionIndex,
        categoryTitle: event.categoryTitle,
        arCategoryTitle: event.arCategoryTitle,
        swapCategoriesListData: [],
        currentPage: 1,
      ));
    }
    final result = await getIt
        .get<SwapUseCases>()
        .getCategoryBySectionID(state.secID, state.currentPage);
    result.fold((l) {
      emit(state.copyWith(
          swapSectionsStateStatus: SwapSectionsStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!event.isSeeMore) {
        ProgressCircleDialog.dismiss();
      }
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      SwapCategoryModel categoryData = SwapCategoryModel.fromJson(r.data);
      int lastPage = categoryData.data!.lastPage!;
      List<SwapCategoryItem> newResultList =
          categoryData.data!.categoryItemList!.toList();
      List<SwapCategoryItem> categoriesListData =
          state.swapCategoriesListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapSectionsStateStatus: SwapSectionsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      categoriesListData.addAll(newResultList);
      emit(state.copyWith(
        swapSectionsStateStatus: SwapSectionsStateStatus.SUCCESS,
        swapCategoriesListData: categoriesListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  ///Event to get variables back to initial values at [SectionScreen].
  FutureOr<void> _resetVarEvent(
      SwapResetVarEvent event, Emitter<SwapSectionsState> emit) {
    emit(state.copyWith(
      swapSectionsStateStatus: SwapSectionsStateStatus.SUCCESS,
      sectionIndex: -1,
      currentPage: 1,
      isMoreData: true,
      swapCategoriesListData: [],
      secID: -1,
      categoryTitle: '',
    ));
  }

  FutureOr<void> _selectItem(
      SwapSelectItemEvent event, Emitter<SwapSectionsState> emit) {
    int index = event.index;
    emit(state.copyWith(sectionIndex: index));
  }
}
