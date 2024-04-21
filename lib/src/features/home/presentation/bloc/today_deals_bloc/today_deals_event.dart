
abstract class TodayDealsEvent {}


class GetToadyDealsDataEvent extends TodayDealsEvent{
  final bool isSeeMore;
  GetToadyDealsDataEvent({this.isSeeMore= false});
}

