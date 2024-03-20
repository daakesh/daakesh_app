
import '../../../../../src.export.dart';

abstract class PassDataEvent {}

class PassTodayDealDataEvent extends PassDataEvent{
  final TodayItem todayDealItem;
  PassTodayDealDataEvent({required this.todayDealItem});
}
class ZoomInOutEvent extends PassDataEvent{}
class SelectProductPropertiesEvent extends PassDataEvent{
  final int? productSliderIndex;
  final int? productSizeIndex;

  SelectProductPropertiesEvent({
    this.productSliderIndex,
    this.productSizeIndex,
  });
}
class DetermentTodayDealEvent extends PassDataEvent{
  final bool isDaakeshTodayDeal;
  DetermentTodayDealEvent({required this.isDaakeshTodayDeal});
}
class PassSectionSubCategoriesEvent extends PassDataEvent{
  final List<CategoryItem> categoriesListData;
  PassSectionSubCategoriesEvent({required this.categoriesListData});
}

class PreviewSectionSubCategoriesEvent extends PassDataEvent{
  final int index;
  PreviewSectionSubCategoriesEvent({required this.index});
}
