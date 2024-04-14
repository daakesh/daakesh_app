import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum MySwapOrderStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension MySwapOrderStateStatusX on MySwapOrderStateStatus {
  bool get isInitial => this == MySwapOrderStateStatus.INITIAL;
  bool get isSuccess => this == MySwapOrderStateStatus.SUCCESS;
  bool get isError => this == MySwapOrderStateStatus.ERROR;
  bool get isLoading => this == MySwapOrderStateStatus.LOADING;
}

class MySwapOrderState extends Equatable {
  final MySwapOrderStateStatus mySwapOrderStateStatus;
  final List<SendReceiveSwapReqItem> sendSwapReqList;
  final List<SendReceiveSwapReqItem> receiveSwapReqList;

  const MySwapOrderState({
    this.mySwapOrderStateStatus = MySwapOrderStateStatus.INITIAL,
    this.sendSwapReqList = const [],
    this.receiveSwapReqList = const [],
  });

  MySwapOrderState copyWith({
    MySwapOrderStateStatus? mySwapOrderStateStatus,
    List<SendReceiveSwapReqItem>? sendSwapReqList,
    List<SendReceiveSwapReqItem>? receiveSwapReqList,
  }) {
    return MySwapOrderState(
      mySwapOrderStateStatus:
          mySwapOrderStateStatus ?? this.mySwapOrderStateStatus,
      sendSwapReqList: sendSwapReqList ?? this.sendSwapReqList,
      receiveSwapReqList: receiveSwapReqList ?? this.receiveSwapReqList,
    );
  }

  @override
  List<Object?> get props => [
        mySwapOrderStateStatus,
        sendSwapReqList,
        receiveSwapReqList,
      ];
}
