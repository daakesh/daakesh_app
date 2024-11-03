import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../src.export.dart';

abstract class AddProEvent {}

class AddEditStateEvent extends AddProEvent {
  final AdjustProduct adjustProduct;
  AddEditStateEvent({
    required this.adjustProduct,
  });
}

class AddProInfoEvent extends AddProEvent {
  final String productName;
  final String productDescription;
  AddProInfoEvent({
    required this.productName,
    required this.productDescription,
  });
}

class AddProCategoriesEvent extends AddProEvent {
  final int productSecID;
  final int productCatID;
  final int? productSubCatID;
  final int? productBrandID;
  final String productModelYear;

  AddProCategoriesEvent({
    required this.productSecID,
    required this.productCatID,
    this.productSubCatID,
    this.productBrandID,
    required this.productModelYear,
  });
}

class AddProImagesEvent extends AddProEvent {
  final List<XFile> proImages;
  final List<String> oldImages;
  AddProImagesEvent({
    required this.proImages,
    required this.oldImages,
  });
}

class AddProDisplayMethodEvent extends AddProEvent {
  final ProductDisplayMethod displayMethod;
  AddProDisplayMethodEvent({
    required this.displayMethod,
  });
}

class AddSaleInfoEvent extends AddProEvent {
  final String productQuantity;
  final String productPrice;
  final String? productDiscount;

  AddSaleInfoEvent({
    required this.productQuantity,
    required this.productPrice,
    this.productDiscount,
  });
}

class AddSwapInfoEvent extends AddProEvent {
  final String displayProduct;
  final String swapCountry;
  final String swapCity;

  AddSwapInfoEvent({
    required this.displayProduct,
    required this.swapCountry,
    required this.swapCity,
  });
}

class AddShipToCountryEvent extends AddProEvent {
  final String shipToCountry;

  AddShipToCountryEvent({
    required this.shipToCountry,
  });
}

class AddProductEvent extends AddProEvent {
  final BuildContext context;

  AddProductEvent({required this.context});
}
