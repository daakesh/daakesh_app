import 'package:image_picker/image_picker.dart';
import '../../../../../src.export.dart';

abstract class MyProFuncEvent {}

class SwapTabBarProductTypeEvent extends MyProFuncEvent {
  final ProductTapBar productTapBar;
  SwapTabBarProductTypeEvent({required this.productTapBar});
}

class ChooseProductDisplayMethodEvent extends MyProFuncEvent {
  final ProductDisplayMethod productDisplayMethod;
  ChooseProductDisplayMethodEvent({required this.productDisplayMethod});
}

class ChangeCountrySwapFlagEvent extends MyProFuncEvent {
  final String flagEmoji;
  ChangeCountrySwapFlagEvent({
    required this.flagEmoji,
  });
}

class SelectShipToCountryEvent extends MyProFuncEvent {
  final String shipToFlagEmoji;
  SelectShipToCountryEvent({
    required this.shipToFlagEmoji,
  });
}

class DeleteInsertCountriesEvent extends MyProFuncEvent {
  final List<String> selectedShipCountry;
  DeleteInsertCountriesEvent({
    required this.selectedShipCountry,
  });
}

class CheckAlreadyAddedCountryEvent extends MyProFuncEvent {
  final String value;
  CheckAlreadyAddedCountryEvent({required this.value});
}

class DeleteAddedCountryEvent extends MyProFuncEvent {
  final int index;
  DeleteAddedCountryEvent({required this.index});
}

class ResetValuesEvent extends MyProFuncEvent {}

class AddProductImageEvent extends MyProFuncEvent {
  final List<XFile> imagesList;
  AddProductImageEvent({required this.imagesList});
}

class EditProductEvent extends MyProFuncEvent {
  final MyProductItem myProductItem;
  final ProductDisplayMethod productDisplayMethod;
  EditProductEvent(
      {required this.myProductItem, required this.productDisplayMethod});
}

class SearchOnProductEvent extends MyProFuncEvent {
  final String? searchValue;
  final int page;
  final bool isSeeMore;
  SearchOnProductEvent(
      {this.searchValue, this.page = 1, this.isSeeMore = false});
}

class EmptyProductSearchEvent extends MyProFuncEvent {
  final String value;
  final bool isClear;
  EmptyProductSearchEvent({this.isClear = false, required this.value});
}

class OnOffDiscountEvent extends MyProFuncEvent {
  final bool value;
  OnOffDiscountEvent({required this.value});
}

class SetOldImageEvent extends MyProFuncEvent {}

class RemoveOldImageEvent extends MyProFuncEvent {
  final List<String> oldImages;
  RemoveOldImageEvent(this.oldImages);
}
