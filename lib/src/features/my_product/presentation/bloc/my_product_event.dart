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



