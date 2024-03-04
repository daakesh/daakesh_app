
import '../../../../../src.export.dart';

abstract class SwapEvent{}


class ToggleSwapScreenStateEvent extends SwapEvent{
  final SwapScreenState swapScreenState;
  ToggleSwapScreenStateEvent({required this.swapScreenState});
}
class SwapGetToTopScreenEvent extends SwapEvent{}

class SwapDetermentTodayDealEvent extends SwapEvent{
  final bool isDaakeshTodayDeal;
  SwapDetermentTodayDealEvent({required this.isDaakeshTodayDeal});
}

class SwapSetFilterDataEvent extends SwapEvent{
  final int? rateTypeIndex;
  final int? productTypeIndex;

  SwapSetFilterDataEvent({
    this.rateTypeIndex,
    this.productTypeIndex,
  });
}

class SwapSelectProductPropertiesEvent extends SwapEvent{
  final int? productSliderIndex;
  final int? productSizeIndex;

  SwapSelectProductPropertiesEvent({
    this.productSliderIndex,
    this.productSizeIndex,
  });
}
class SwapSelectProductSizeIndex extends SwapEvent{
  final int productSizeIndex;
  SwapSelectProductSizeIndex({required this.productSizeIndex});
}
class SwapGetSectionDataEvent extends SwapEvent{}

class SwapGetTodayItemsDataEvent extends SwapEvent{}

class SwapGetDaakeshTodayItemsDataEvent extends SwapEvent{}













