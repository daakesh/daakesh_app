abstract class HomeEvent{}

class SearchOnOffEvent extends HomeEvent{
  final bool isSearchOn;
  SearchOnOffEvent({required this.isSearchOn});
}

