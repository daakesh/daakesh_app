
abstract class SwapSearchEvent{}

class SwapSearchOnItemsEvent extends SwapSearchEvent{
  final String? searchValue;
  final int page;
  final bool isSeeMore;
  SwapSearchOnItemsEvent({this.searchValue,this.page = 1,this.isSeeMore = false});
}
class SwapEmptySearchEvent extends SwapSearchEvent{

}











