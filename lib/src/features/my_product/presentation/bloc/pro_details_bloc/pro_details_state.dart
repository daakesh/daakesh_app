import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum ProDetailsStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension ProDetailsStateStatusX on ProDetailsStateStatus {
  bool get isInitial => this == ProDetailsStateStatus.INITIAL;
  bool get isSuccess => this == ProDetailsStateStatus.SUCCESS;
  bool get isError => this == ProDetailsStateStatus.ERROR;
  bool get isLoading => this == ProDetailsStateStatus.LOADING;
  bool get isLoadingMore => this == ProDetailsStateStatus.LOADINGMORE;
  bool get isNull => this == ProDetailsStateStatus.NULL;
}

class ProDetailsState extends Equatable {
  final ProDetailsStateStatus proDetailsStateStatus;
  final List<ProSectionItemModel> sectionListData;
  final List<ProCategoryItem> proCategoryListData;
  final List<ProSubCategoryItem> proSubCategoryListData;
  final List<ProBrandItem> proBrandListData;

  ///
  final String? productSecID;
  final String? productCatID;
  final String? productSubCatID;
  final String? productBrandID;
  final String? productModelYear;

  const ProDetailsState({
    this.proDetailsStateStatus = ProDetailsStateStatus.INITIAL,
    this.sectionListData = const [],
    this.proCategoryListData = const [],
    this.proSubCategoryListData = const [],
    this.proBrandListData = const [],

    ///
    this.productSecID,
    this.productCatID,
    this.productSubCatID,
    this.productBrandID,
    this.productModelYear,
  });

  ProDetailsState copyWith({
    ProDetailsStateStatus? proDetailsStateStatus,
    List<ProSectionItemModel>? sectionListData,
    List<ProCategoryItem>? proCategoryListData,
    List<ProSubCategoryItem>? proSubCategoryListData,
    List<ProBrandItem>? proBrandListData,
    String? productSecID,
    String? productCatID,
    String? productSubCatID,
    String? productBrandID,
    String? productModelYear,
  }) {
    return ProDetailsState(
      proDetailsStateStatus:
          proDetailsStateStatus ?? this.proDetailsStateStatus,
      sectionListData: sectionListData ?? this.sectionListData,
      proCategoryListData: proCategoryListData ?? this.proCategoryListData,
      proSubCategoryListData:
          proSubCategoryListData ?? this.proSubCategoryListData,
      proBrandListData: proBrandListData ?? this.proBrandListData,

      ///
      productSecID: productSecID ?? this.productSecID,
      productCatID: productCatID ?? this.productCatID,
      productSubCatID: productSubCatID ?? this.productSubCatID,
      productBrandID: productBrandID ?? this.productBrandID,
      productModelYear: productModelYear ?? this.productModelYear,
    );
  }

  @override
  List<Object?> get props => [
        proDetailsStateStatus,
        sectionListData,
        proCategoryListData,
        proSubCategoryListData,
        proBrandListData,
        productSecID,
        productCatID,
        productSubCatID,
        productBrandID,
        productModelYear,
      ];
}
