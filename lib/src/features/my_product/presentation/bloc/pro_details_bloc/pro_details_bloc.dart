import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class ProDetailsBloc extends Bloc<ProDetailsEvent, ProDetailsState> {
  ProDetailsBloc() : super(const ProDetailsState()) {
    on<GetProSectionsEvent>(_getProSections);
    on<GetProCategoryEvent>(_getProCategory);
    on<CheckCategoryHasSubEvent>(_checkCategoryHasSub);
    on<GetProSubCategoryEvent>(_getProSubCategory);
    on<GetBrandsBySectionEvent>(_getBrandsBySection);
    on<GetDropDownDataEvent>(_getDropDownData);
    on<ResetCategoriesDataEvent>(_resetCategoriesData);
  }
  static ProDetailsBloc get get => BlocProvider.of(Utils.currentContext);
  FutureOr<void> _getProSections(
      GetProSectionsEvent event, Emitter<ProDetailsState> emit) async {
    emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.LOADING,
        proCategoryListData: [],
        proSubCategoryListData: [],
        proBrandListData: [],
        productCatID: null));
    final result = await getIt.get<MyProductUseCases>().getSections();
    result.fold((l) {
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProductSectionModel sectionModel = ProductSectionModel.fromJson(r.data);
      List<ProSectionItemModel> sectionListData = sectionModel.data!.toList();
      if (event.isEdit) {
        if (isEdit()) {
          emit(state.copyWith(
            proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
            sectionListData: sectionListData,
            productSecID:
                getIt.get<EditProduct>().myProductItem!.section!.id.toString(),
          ));
        }
        return;
      }
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        sectionListData: sectionListData,
      ));
    });
  }

  FutureOr<void> _getProCategory(
      GetProCategoryEvent event, Emitter<ProDetailsState> emit) async {
    ProgressCircleDialog.show();
    emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.LOADING,
        proCategoryListData: [],
        proSubCategoryListData: [],
        productSecID: event.secID,
        productSubCatID: "-1"));

    final result =
        await getIt.get<MyProductUseCases>().getCategoryBySection(event.secID);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();
      ProCategoryModel proCategoryModel = ProCategoryModel.fromJson(r.data);
      List<ProCategoryItem> proCategoryListData =
          proCategoryModel.data!.toList();

      if (event.isEdit) {
        if (isEdit()) {
          emit(state.copyWith(
            proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
            proCategoryListData: proCategoryListData,
            productCatID:
                getIt.get<EditProduct>().myProductItem!.category!.id.toString(),
          ));
        }
        return;
      }
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proCategoryListData: proCategoryListData,
        productCatID: proCategoryListData.first.id.toString(),
      ));
    });
  }

  FutureOr<void> _getProSubCategory(
      GetProSubCategoryEvent event, Emitter<ProDetailsState> emit) async {
    ProgressCircleDialog.show();
    emit(state.copyWith(
      proDetailsStateStatus: ProDetailsStateStatus.LOADING,
      productCatID: event.catID,
      //productSubCatID: null,
    ));
    final result = await getIt
        .get<MyProductUseCases>()
        .getSubcategoryByCategoryId(event.catID);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ProgressCircleDialog.dismiss();
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProgressCircleDialog.dismiss();
      ProSubCategoryModel proSubCategoryModel =
          ProSubCategoryModel.fromJson(r.data);
      List<ProSubCategoryItem> proSubCategoryListData =
          proSubCategoryModel.data!.toList();

      if (event.isEdit) {
        if (isEdit()) {
          emit(state.copyWith(
            proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
            proSubCategoryListData: proSubCategoryListData,
            productSubCatID: proSubCategoryListData.isNotEmpty
                ? getIt
                    .get<EditProduct>()
                    .myProductItem!
                    .subcategory!
                    .id
                    .toString()
                : "-1",
          ));
        }
        return;
      }
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proSubCategoryListData: proSubCategoryListData,
        productSubCatID: proSubCategoryListData.isNotEmpty
            ? proSubCategoryListData.first.id.toString()
            : "-1",
      ));
    });
  }

  FutureOr<void> _getBrandsBySection(
      GetBrandsBySectionEvent event, Emitter<ProDetailsState> emit) async {
    emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.LOADING));
    final result =
        await getIt.get<MyProductUseCases>().getBrandsBySection(event.secID);
    result.fold((l) {
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProBrandModel proBrandModel = ProBrandModel.fromJson(r.data);
      List<ProBrandItem> proBrandListData = proBrandModel.data!.toList();
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proBrandListData: proBrandListData,
      ));
      if (event.isEdit) {
        if (isEdit()) {
          emit(state.copyWith(
            proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
            proBrandListData: proBrandListData,
            productBrandID:
                getIt.get<EditProduct>().myProductItem!.brand!.id.toString(),
          ));
        }
        return;
      }
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proBrandListData: proBrandListData,
        productBrandID: proBrandListData.isNotEmpty
            ? proBrandListData.first.id.toString()
            : null,
      ));
    });
  }

  FutureOr<void> _checkCategoryHasSub(
      CheckCategoryHasSubEvent event, Emitter<ProDetailsState> emit) async {
    emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.LOADING));
    final result =
        await getIt.get<MyProductUseCases>().isCategoryHasSub(event.catID);
    result.fold((l) {
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      emit(
          state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getDropDownData(
      GetDropDownDataEvent event, Emitter<ProDetailsState> emit) {
    if (getIt.get<EditProduct>().myProductItem != null) {
      String productSecID =
          getIt.get<EditProduct>().myProductItem!.section!.id.toString();
      String productCatID =
          getIt.get<EditProduct>().myProductItem!.category!.id.toString();
      getProSections();
      getProCategory(productSecID.toString());
      getProBrand(productSecID.toString());
      if (getIt.get<EditProduct>().myProductItem!.subcategory != null) {
        getProSubCategory(productCatID.toString());
      }
    } else {
      ProDetailsBloc.get.add(GetProSectionsEvent());
    }
  }

  FutureOr<void> _resetCategoriesData(
      ResetCategoriesDataEvent event, Emitter<ProDetailsState> emit) {
    if (!isEdit()) {
      emit(state.copyWith(
        productSubCatID: null,
        productBrandID: null,
      ));
    }
  }
}

bool isEdit() => getIt.get<EditProduct>().myProductItem != null;
void getProSections() {
  ProDetailsBloc.get.add(GetProSectionsEvent(isEdit: true));
}

void getProCategory(String secID) {
  ProDetailsBloc.get.add(GetProCategoryEvent(secID: secID, isEdit: true));
}

void getProBrand(String secID) {
  ProDetailsBloc.get.add(GetBrandsBySectionEvent(secID: secID, isEdit: true));
}

void getProSubCategory(String catID) {
  ProDetailsBloc.get.add(GetProSubCategoryEvent(catID: catID, isEdit: true));
}
