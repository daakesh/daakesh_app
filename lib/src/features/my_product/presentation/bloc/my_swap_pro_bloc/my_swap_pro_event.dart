abstract class MySwapProEvent {}

class GetMySwapProEvent extends MySwapProEvent {
  final bool isSeeMore;
  GetMySwapProEvent({this.isSeeMore = false});
}

class ClearSwapDataEvent extends MySwapProEvent {}

class RemoveSwapItemEvent extends MySwapProEvent {
  final int id;

  RemoveSwapItemEvent({required this.id});
}
