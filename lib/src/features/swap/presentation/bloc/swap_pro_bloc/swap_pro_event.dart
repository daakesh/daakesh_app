abstract class SwapProEvent {}

class GetSwapProductEvent extends SwapProEvent {
  final bool isSeeMore;
  GetSwapProductEvent({this.isSeeMore = false});
}

class ResetMySwapItemDataEvent extends SwapProEvent {}
