import 'package:equatable/equatable.dart';
import '../../../../src.export.dart';

enum MyOrderStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension MyOrderStateStatusX on MyOrderStateStatus{
  bool get isInitial => this == MyOrderStateStatus.INITIAL;
  bool get isSuccess => this == MyOrderStateStatus.SUCCESS;
  bool get isError => this == MyOrderStateStatus.ERROR;
  bool get isLoading => this == MyOrderStateStatus.LOADING;
}

class MyOrderState extends Equatable {
  final MyOrderStateStatus myOrderStateStatus;
  final MyOrderTapBar myOrderTapBar;
  final bool sendReceiveFlag;

  const MyOrderState({
    this.myOrderStateStatus = MyOrderStateStatus.INITIAL,
    this.myOrderTapBar = MyOrderTapBar.MYORDER,
    this.sendReceiveFlag = false,


  });

  MyOrderState copyWith({
    MyOrderStateStatus? myOrderStateStatus,
    MyOrderTapBar? myOrderTapBar,
    bool? sendReceiveFlag,

  }) {
    return MyOrderState(
      myOrderStateStatus: myOrderStateStatus ?? this.myOrderStateStatus,
      myOrderTapBar: myOrderTapBar ?? this.myOrderTapBar,
      sendReceiveFlag: sendReceiveFlag ?? this.sendReceiveFlag,



    );
  }

  @override
  List<Object?> get props => [
    myOrderStateStatus,
    myOrderTapBar,
    sendReceiveFlag,

  ];
}
