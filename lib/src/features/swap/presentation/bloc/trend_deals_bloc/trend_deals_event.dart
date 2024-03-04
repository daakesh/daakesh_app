
abstract class TrendDealsEvent {}


class GetTrendDealsDataEvent extends TrendDealsEvent{
  final bool isSeeMore;
  GetTrendDealsDataEvent({this.isSeeMore= false});
}
