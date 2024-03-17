
import '../../../../../src.export.dart';

abstract class HomeEvent{}


class SwapHomeScreenStateEvent extends HomeEvent{
  final HomeScreenState homeScreenState;
  SwapHomeScreenStateEvent({required this.homeScreenState});
}

class GetToTopScreenEvent extends HomeEvent{}

class ChangeIndexEvent extends HomeEvent{
  final int? index;
  ChangeIndexEvent({this.index});
}


class SetFilterDataEvent extends HomeEvent{
  final int? rateTypeIndex;
  final int? productTypeIndex;

  SetFilterDataEvent({
    this.rateTypeIndex,
    this.productTypeIndex,
  });
}


class SelectProductSizeIndex extends HomeEvent{
  final int productSizeIndex;
  SelectProductSizeIndex({required this.productSizeIndex});
}

class GetSectionDataEvent extends HomeEvent{}















