abstract class MySwapProEvent {}

class GetMySwapProEvent extends MySwapProEvent {
  final bool isSeeMore;
  GetMySwapProEvent({this.isSeeMore = false});
}

class ClearSwapDataEvent extends MySwapProEvent {}
