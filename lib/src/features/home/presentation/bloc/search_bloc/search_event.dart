
abstract class SearchEvent{}

class SearchOnItemsEvent extends SearchEvent{
  final String? searchValue;
  final int page;
  final bool isSeeMore;
  SearchOnItemsEvent({this.searchValue,this.page = 1,this.isSeeMore = false});
}
class EmptySearchEvent extends SearchEvent{}











