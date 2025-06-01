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
  final int productSecID;
  final int productCatID;
  final int productSubCatID;
  final int productBrandID;
  final String productModelYear;
  final List<String> oldImages;
  final List<XFile> proImages;
  final ProductDisplayMethod displayMethod;

  ///Sale data
  final String productQuantity;
  final String productPrice;
  final String productDiscount;

  ///Swap data
  final String displayProduct;
  final String swapCountry;
  final String swapCity;
  final String shipToCountry;
  final String latitude;
  final String longitude;

  const AddProState({
    this.addProStateStatus = AddProStateStatus.INITIAL,
    this.adjustProduct = AdjustProduct.ADD,
    this.productName = '',
    this.productDescription = '',
    this.productSecID = 1000,
    this.productCatID = 1000,
    this.productSubCatID = 1000,
    this.productBrandID = 1000,
    this.productModelYear = '',
    this.oldImages = const [],
    this.proImages = const [],
    this.displayMethod = ProductDisplayMethod.Sell,
    this.productQuantity = '',
    this.productPrice = '',
    this.productDiscount = '',

    ///Swap data
    this.displayProduct = '',
    this.swapCountry = 'Jordan',
    this.swapCity = 'Amman',

    ///
    this.shipToCountry = '',
    this.latitude = '',
    this.longitude = '',
  });

  AddProState copyWith({
    AddProStateStatus? addProStateStatus,
    AdjustProduct? adjustProduct,
    String? productName,
    String? productDescription,
    int? productSecID,
    int? productCatID,
    int? productSubCatID,
    int? productBrandID,
    String? productModelYear,
    List<String>? oldImages,
    List<XFile>? proImages,
    ProductDisplayMethod? displayMethod,

    ///Sale Data
    String? productQuantity,
    String? productPrice,
    String? productDiscount,

    ///Swap Data
    String? displayProduct,
    String? swapCountry,
    String? swapCity,

    ///
    String? shipToCountry,
    String? latitude,
    String? longitude,
  }) {
    return AddProState(
      addProStateStatus: addProStateStatus ?? this.addProStateStatus,
      adjustProduct: adjustProduct ?? this.adjustProduct,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productSecID: productSecID ?? this.productSecID,
      productCatID: productCatID ?? this.productCatID,
      productSubCatID: productSubCatID ?? this.productSubCatID,
      productBrandID: productBrandID ?? this.productBrandID,
      productModelYear: productModelYear ?? this.productModelYear,
      oldImages: oldImages ?? this.oldImages,
      proImages: proImages ?? this.proImages,
      displayMethod: displayMethod ?? this.displayMethod,

      ///
      productQuantity: productQuantity ?? this.productQuantity,
      productPrice: productPrice ?? this.productPrice,
      productDiscount: productDiscount ?? this.productDiscount,

      ///
      displayProduct: displayProduct ?? this.displayProduct,
      swapCountry: swapCountry ?? this.swapCountry,
      swapCity: swapCity ?? this.swapCity,

      ///
      shipToCountry: shipToCountry ?? this.shipToCountry,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
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
        oldImages,
        proImages,
        displayMethod,

        ///
        productQuantity,
        productPrice,
        productDiscount,

        ///
        displayProduct,
        swapCountry,
        swapCity,

        ///
        shipToCountry,
        latitude,
        longitude,
      ];
}
