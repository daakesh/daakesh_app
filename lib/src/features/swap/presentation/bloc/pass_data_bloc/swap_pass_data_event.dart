import '../../../../../src.export.dart';

abstract class SwapPassDataEvent {}

class PassTrendingDealDataEvent extends SwapPassDataEvent {
  final TrendDealsItem trendDealsItem;
  PassTrendingDealDataEvent({required this.trendDealsItem});
}

class ChangeProductSliderIndex extends SwapPassDataEvent {
  final int sliderIndex;
  ChangeProductSliderIndex({required this.sliderIndex});
}

class SwapZoomInOutEvent extends SwapPassDataEvent {}

class PassMySwapProductListEvent extends SwapPassDataEvent {
  final List<MyProductItem> mySwapProductData;
  PassMySwapProductListEvent({this.mySwapProductData = const []});
}

class PassMySwapProductDataEvent extends SwapPassDataEvent {
  final int index;
  PassMySwapProductDataEvent({this.index = 0});
}

class PassSwapCommentEvent extends SwapPassDataEvent {
  final String comment;
  PassSwapCommentEvent({required this.comment});
}

class ResetSwapPassValuesEvent extends SwapPassDataEvent {}
