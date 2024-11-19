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
        productBrandID: -1,
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
            productSecID: getIt.get<EditProduct>().myProductItem!.section!.id,
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
        productSubCatID: 1000,
        productSecID: event.secID));

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
            productCatID: getIt.get<EditProduct>().myProductItem!.category!.id,
          ));
        }
        return;
      }
      getProSubCategory(proCategoryListData.first.id!, isEdit: event.isEdit);
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proCategoryListData: proCategoryListData,
        productCatID: proCategoryListData.first.id,
      ));
    });
  }

  FutureOr<void> _getProSubCategory(
      GetProSubCategoryEvent event, Emitter<ProDetailsState> emit) async {
    ProgressCircleDialog.show();
    emit(state.copyWith(
      proDetailsStateStatus: ProDetailsStateStatus.LOADING,
      productCatID: event.catID,
      //productSubCatID: -1,
      proSubCategoryListData: [],
    ));
    final result = await getIt
        .get<MyProductUseCases>()
        .getSubcategoryByCategoryId(event.catID);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(proDetailsStateStatus: ProDetailsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      ProSubCategoryModel proSubCategoryModel =
          ProSubCategoryModel.fromJson(r.data);
      List<ProSubCategoryItem> proSubCategoryListData = [];

      proSubCategoryListData = proSubCategoryModel.data!.toList();
      proSubCategoryListData.insert(proSubCategoryListData.length,
          ProSubCategoryItem(id: 1000, name: "None", arName: "بدون"));
      //proSubCategoryListData.insert(0, ProSubCategoryItem(id: -1, name: "null", arName: "بدون"));
      int subID;
      try {
        ProSubCategoryItem proSubCategoryItem =
            proSubCategoryListData.firstWhere((element) =>
                element.id.toString() ==
                getIt
                    .get<EditProduct>()
                    .myProductItem!
                    .subcategory!
                    .id
                    .toString());

        subID = proSubCategoryItem.id!;
      } catch (e) {
        subID = 1000;
      }

      if (event.isEdit) {
        if (isEdit()) {
          emit(state.copyWith(
            proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
            proSubCategoryListData: proSubCategoryListData,
            productSubCatID: subID,
          ));
          return;
        }
        return;
      }

      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proSubCategoryListData: proSubCategoryListData,
        productSubCatID: proSubCategoryListData.first.id,
      ));
    });
  }

  FutureOr<void> _getBrandsBySection(
      GetBrandsBySectionEvent event, Emitter<ProDetailsState> emit) async {
    emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.LOADING,
        proBrandListData: []));
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
      proBrandListData.insert(proBrandListData.length,
          ProBrandItem(id: 1000, name: "None", arName: "بدون"));
      emit(state.copyWith(
        proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
        proBrandListData: proBrandListData,
      ));
      if (event.isEdit) {
        if (isEdit()) {
          if (getIt.get<EditProduct>().myProductItem!.brand!.id != 0) {
            emit(state.copyWith(
              proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
              proBrandListData: proBrandListData,
              productBrandID: getIt.get<EditProduct>().myProductItem!.brand!.id,
            ));
          } else {
            emit(state.copyWith(
                proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
                proBrandListData: proBrandListData,
                productBrandID: 1000));
          }
        }
        return;
      }
      emit(state.copyWith(
          proDetailsStateStatus: ProDetailsStateStatus.SUCCESS,
          proBrandListData: proBrandListData,
          productBrandID: proBrandListData.first.id));
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
      int productSecID = getIt.get<EditProduct>().myProductItem!.section!.id!;
      int productCatID = getIt.get<EditProduct>().myProductItem!.category!.id!;
      getProSections();
      getProCategory(productSecID);
      getProBrand(productSecID);
      getProSubCategory(productCatID);
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

void getProCategory(int secID) {
  ProDetailsBloc.get.add(GetProCategoryEvent(secID: secID, isEdit: true));
}

void getProBrand(int secID) {
  ProDetailsBloc.get.add(GetBrandsBySectionEvent(secID: secID, isEdit: true));
}

void getProSubCategory(int catID, {bool isEdit = true}) {
  ProDetailsBloc.get.add(GetProSubCategoryEvent(catID: catID, isEdit: isEdit));
}
