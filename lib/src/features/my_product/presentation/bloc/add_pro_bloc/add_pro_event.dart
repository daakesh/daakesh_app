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
  final String productSecID;
  final String productCatID;
  final String productSubCatID;
  final String productBrandID;
  final String productModelYear;

  AddProCategoriesEvent({
    required this.productSecID,
    required this.productCatID,
    required this.productSubCatID,
    required this.productBrandID,
    required this.productModelYear,
  });
}
class AddProImagesEvent extends AddProEvent {
  final List<XFile> proImages;
  AddProImagesEvent({
    required this.proImages,
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
  final String? fromDate;
  final String? toDate;

  AddSaleInfoEvent({
    required this.productQuantity,
    required this.productPrice,
    this.productDiscount,
    this.fromDate,
    this.toDate,
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
class AddProductEvent extends AddProEvent{}