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

class ShowMoreProductDetailsEvent extends HomeEvent{
  final bool isProductDetailsOn;
  final bool? isDaakeshTodayDeal;
  ShowMoreProductDetailsEvent({required this.isProductDetailsOn,this.isDaakeshTodayDeal});
}
class ShowSearchResultEvent extends HomeEvent{
  final bool isShowSearchResult;
  ShowSearchResultEvent({required this.isShowSearchResult});
}
class ShowCartEvent extends HomeEvent{
  final bool isShowCart;
  ShowCartEvent({required this.isShowCart});
}


class ChangeProductSliderIndexEvent extends HomeEvent{
  final int sliderIndex;
  ChangeProductSliderIndexEvent({required this.sliderIndex});
}
class SelectProductSizeIndex extends HomeEvent{
  final int productSizeIndex;
  SelectProductSizeIndex({required this.productSizeIndex});
}








