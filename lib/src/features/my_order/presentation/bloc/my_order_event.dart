import '../../../../src.export.dart';

abstract class MyOrderEvent {}


class ToggleMyOrderTabBarEvent extends MyOrderEvent{
  final MyOrderTapBar myOrderTapBar;
  ToggleMyOrderTabBarEvent({required this.myOrderTapBar});
}

class SendReceiveSwitchEvent extends MyOrderEvent{
  final bool sendReceiveFlag;
  SendReceiveSwitchEvent({required this.sendReceiveFlag});
}
