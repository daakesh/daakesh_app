// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../src.export.dart';

enum AddProStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension AddProStateStatusX on AddProStateStatus {
  bool get isInitial => this == AddProStateStatus.INITIAL;
  bool get isSuccess => this == AddProStateStatus.SUCCESS;
  bool get isError => this == AddProStateStatus.ERROR;
  bool get isLoading => this == AddProStateStatus.LOADING;
  bool get isLoadingMore => this == AddProStateStatus.LOADINGMORE;
  bool get isNull => this == AddProStateStatus.NULL;
}

class AddProState extends Equatable {
  final AddProStateStatus addProStateStatus;
  final AdjustProduct adjustProduct;
  final String productName;
  final String productDescription;
  final String productSecID;
  final String productCatID;
  final String? productSubCatID;
  final String? productBrandID;
  final String productModelYear;
  final List<XFile> proImages;
  final ProductDisplayMethod displayMethod;

  ///Sale data
  final String productQuantity;
  final String productPrice;
  final String productDiscount;
  final String fromDate;
  final String toDate;

  ///Swap data
  final String displayProduct;
  final String swapCountry;
  final String swapCity;
  final String shipToCountry;

  const AddProState({
    this.addProStateStatus = AddProStateStatus.INITIAL,
    this.adjustProduct = AdjustProduct.ADD,
    this.productName = '',
    this.productDescription = '',
    this.productSecID = '',
    this.productCatID = '',
    this.productSubCatID,
    this.productBrandID,
    this.productModelYear = '',
    this.proImages = const [],
    this.displayMethod = ProductDisplayMethod.Sell,
    this.productQuantity = '',
    this.productPrice = '',
    this.productDiscount = '',
    this.fromDate = '',
    this.toDate = '',

    ///Swap data
    this.displayProduct = '',
    this.swapCountry = 'Jordan',
    this.swapCity = 'Amman',

    ///
    this.shipToCountry = '',
  });

  AddProState copyWith({
    AddProStateStatus? addProStateStatus,
    AdjustProduct? adjustProduct,
    String? productName,
    String? productDescription,
    String? productSecID,
    String? productCatID,
    String? productSubCatID,
    String? productBrandID,
    String? productModelYear,
    List<XFile>? proImages,
    ProductDisplayMethod? displayMethod,

    ///Sale Data
    String? productQuantity,
    String? productPrice,
    String? productDiscount,
    String? fromDate,
    String? toDate,

    ///Swap Data
    String? displayProduct,
    String? swapCountry,
    String? swapCity,

    ///
    String? shipToCountry,
  }) {
    return AddProState(
      addProStateStatus: addProStateStatus ?? this.addProStateStatus,
      adjustProduct: adjustProduct ?? this.adjustProduct,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productSecID: productSecID ?? this.productSecID,
      productCatID: productCatID ?? this.productCatID,
      productSubCatID: productSubCatID,
      productBrandID: productBrandID ?? this.productBrandID,
      productModelYear: productModelYear ?? this.productModelYear,
      proImages: proImages ?? this.proImages,
      displayMethod: displayMethod ?? this.displayMethod,

      ///
      productQuantity: productQuantity ?? this.productQuantity,
      productPrice: productPrice ?? this.productPrice,
      productDiscount: productDiscount ?? this.productDiscount,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,

      ///
      displayProduct: displayProduct ?? this.displayProduct,
      swapCountry: swapCountry ?? this.swapCountry,
      swapCity: swapCity ?? this.swapCity,

      ///
      shipToCountry: shipToCountry ?? this.shipToCountry,
    );
  }

  @override
  List<Object?> get props => [
        addProStateStatus,
        adjustProduct,
        productName,
        productDescription,
        productSecID,
        productCatID,
        productSubCatID,
        productBrandID,
        productModelYear,

        ///
        proImages,
        displayMethod,

        ///
        productQuantity,
        productPrice,
        productDiscount,
        fromDate,
        toDate,

        ///
        displayProduct,
        swapCountry,
        swapCity,

        ///
        shipToCountry,
      ];
}
