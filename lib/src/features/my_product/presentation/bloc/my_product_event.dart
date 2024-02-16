import '../../../../src.export.dart';

abstract class MyProductEvent {}


class SwapTabBarProductTypeEvent extends MyProductEvent{
  final ProductTapBar productTapBar;
  SwapTabBarProductTypeEvent({required this.productTapBar});
}




