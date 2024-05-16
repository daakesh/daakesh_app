import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';

abstract class MySwapOrderEvent {}

class GetSendSwapRequestEvent extends MySwapOrderEvent {
  final bool isSeeMore;

  GetSendSwapRequestEvent({this.isSeeMore = false});
}

class GetReceiveSwapRequestEvent extends MySwapOrderEvent {
  final bool isSeeMore;

  GetReceiveSwapRequestEvent({this.isSeeMore = false});
}

class UpdateOfferEvent extends MySwapOrderEvent {
  final int itemId;
  final int approved;
  UpdateOfferEvent({required this.approved, required this.itemId});
}

class StartSwapEvent extends MySwapOrderEvent {
  final StartSwapModel startSwapModel;
  StartSwapEvent({required this.startSwapModel});
}

class EmptyMyOrderDataEvent extends MySwapOrderEvent {}
