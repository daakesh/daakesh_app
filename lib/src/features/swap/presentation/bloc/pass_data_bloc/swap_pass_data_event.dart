import '../../../../../src.export.dart';

abstract class SwapPassDataEvent {}

class PassTrendingDealDataEvent extends SwapPassDataEvent{
  final TrendDealsItem trendDealsItem;
  PassTrendingDealDataEvent({required this.trendDealsItem});
}

class ChangeProductSliderIndex extends SwapPassDataEvent{
  final int sliderIndex;
  ChangeProductSliderIndex({required this.sliderIndex});
}


class SwapPassSectionSubCategoriesEvent extends SwapPassDataEvent{
  final List<SwapCategoryItem> swapCategoriesListData;
  SwapPassSectionSubCategoriesEvent({required this.swapCategoriesListData});
}

class SwapPreviewSectionSubCategoriesEvent extends SwapPassDataEvent{
  final int index;
  SwapPreviewSectionSubCategoriesEvent({required this.index});
}
class SwapZoomInOutEvent extends SwapPassDataEvent{}
