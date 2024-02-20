
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../src.export.dart';

abstract class MyProductEvent {}


class SwapTabBarProductTypeEvent extends MyProductEvent{
  final ProductTapBar productTapBar;
  SwapTabBarProductTypeEvent({required this.productTapBar});
}
class ChooseProductDisplayMethodEvent extends MyProductEvent{
  final ProductDisplayMethod productDisplayMethod;
  ChooseProductDisplayMethodEvent({required this.productDisplayMethod});
}
class ChangeCountrySwapFlagEvent extends MyProductEvent{
  final String flagEmoji;
  ChangeCountrySwapFlagEvent({
    required this.flagEmoji,
  });
}
class SelectShipToCountryEvent extends MyProductEvent{
  final String shipToFlagEmoji;
  SelectShipToCountryEvent({
    required this.shipToFlagEmoji,
  });
}
class DeleteInsertCountriesEvent extends MyProductEvent{
  final List<String> selectedShipCountry;
  DeleteInsertCountriesEvent({
    required this.selectedShipCountry,
  });
}
class CheckAlreadyAddedCountryEvent extends MyProductEvent{
  final String value;
  CheckAlreadyAddedCountryEvent({required this.value});
}
class DeleteAddedCountryEvent extends MyProductEvent{
  final int index;
  DeleteAddedCountryEvent({required this.index});
}
class ResetValuesEvent extends MyProductEvent{}

class AddProductImageEvent extends MyProductEvent{
  final List<XFile> imagesList;
  AddProductImageEvent({required this.imagesList});
}








