abstract class HomeEvent{}

class SearchOnOffEvent extends HomeEvent{
  final bool isSearchOn;
  SearchOnOffEvent({required this.isSearchOn});
}

class ChangeRateTypeEvent extends HomeEvent{
  final int index;
  ChangeRateTypeEvent({required this.index});
}

class SelectProductTypeEvent extends HomeEvent{
  final int index;
  SelectProductTypeEvent({required this.index});
}

class ShowMoreProductDetails extends HomeEvent{
  final bool isProductDetailsOn;
  final bool? isDaakeshTodayDeal;
  ShowMoreProductDetails({required this.isProductDetailsOn,this.isDaakeshTodayDeal});
}

class ChangeProductSliderIndex extends HomeEvent{
  final int index;
  ChangeProductSliderIndex({required this.index});
}







