abstract class TodayDealsEvent {}

class GetToadyDaakeshDealsDataEvent extends TodayDealsEvent {
  final bool isSeeMore;
  GetToadyDaakeshDealsDataEvent({this.isSeeMore = false});
}

class GetToadyDealsDataEvent extends TodayDealsEvent {
  final bool isSeeMore;
  GetToadyDealsDataEvent({this.isSeeMore = false});
}
