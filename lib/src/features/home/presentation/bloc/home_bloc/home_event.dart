
import '../../../../../src.export.dart';

abstract class HomeEvent{}


class SwapHomeScreenStateEvent extends HomeEvent{
  final HomeScreenState homeScreenState;
  SwapHomeScreenStateEvent({required this.homeScreenState});
}

class DetermentTodayDealEvent extends HomeEvent{
  final bool isDaakeshTodayDeal;
  DetermentTodayDealEvent({required this.isDaakeshTodayDeal});
}

class SetFilterDataEvent extends HomeEvent{
  final int? rateTypeIndex;
  final int? productTypeIndex;

  SetFilterDataEvent({
    this.rateTypeIndex,
    this.productTypeIndex,
  });
}

class SelectProductPropertiesEvent extends HomeEvent{
  final int? productSliderIndex;
  final int? productSizeIndex;

  SelectProductPropertiesEvent({
    this.productSliderIndex,
    this.productSizeIndex,
  });
}
class SelectProductSizeIndex extends HomeEvent{
  final int productSizeIndex;
  SelectProductSizeIndex({required this.productSizeIndex});
}
class GetAllHomeDataEvent extends HomeEvent{}











