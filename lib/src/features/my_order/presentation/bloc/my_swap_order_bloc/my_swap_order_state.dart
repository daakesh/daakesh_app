import 'package:equatable/equatable.dart';

import '../../../../../src.export.dart';

enum MySwapOrderStateStatus {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADINGMORE,
  NULL
}

extension MySwapOrderStateStatusX on MySwapOrderStateStatus {
  bool get isInitial => this == MySwapOrderStateStatus.INITIAL;
  bool get isSuccess => this == MySwapOrderStateStatus.SUCCESS;
  bool get isError => this == MySwapOrderStateStatus.ERROR;
  bool get isLoading => this == MySwapOrderStateStatus.LOADING;
  bool get isLoadingMore => this == MySwapOrderStateStatus.LOADINGMORE;
  bool get isNull => this == MySwapOrderStateStatus.NULL;
}

class MySwapOrderState extends Equatable {
  final MySwapOrderStateStatus mySwapOrderStateStatus;
  final List<SendReceiveSwapReqItem> sendSwapReqList;
  final List<SendReceiveSwapReqItem> receiveSwapReqList;
  final int sendCurrentPage;
  final int receiveCurrentPage;
  final bool isSendMoreData;
  final bool isReceiveMoreData;

  const MySwapOrderState({
    this.mySwapOrderStateStatus = MySwapOrderStateStatus.INITIAL,
    this.sendSwapReqList = const [],
    this.receiveSwapReqList = const [],
    this.sendCurrentPage = 1,
    this.receiveCurrentPage = 1,
    this.isSendMoreData = true,
    this.isReceiveMoreData = true,
  });

  MySwapOrderState copyWith({
    MySwapOrderStateStatus? mySwapOrderStateStatus,
    List<SendReceiveSwapReqItem>? sendSwapReqList,
    List<SendReceiveSwapReqItem>? receiveSwapReqList,
    int? sendCurrentPage,
    int? receiveCurrentPage,
    bool? isSendMoreData,
    bool? isReceiveMoreData,
  }) {
    return MySwapOrderState(
      mySwapOrderStateStatus:
          mySwapOrderStateStatus ?? this.mySwapOrderStateStatus,
      sendSwapReqList: sendSwapReqList ?? this.sendSwapReqList,
      receiveSwapReqList: receiveSwapReqList ?? this.receiveSwapReqList,
      sendCurrentPage: sendCurrentPage ?? this.sendCurrentPage,
      receiveCurrentPage: receiveCurrentPage ?? this.receiveCurrentPage,
      isSendMoreData: isSendMoreData ?? this.isSendMoreData,
      isReceiveMoreData: isReceiveMoreData ?? this.isReceiveMoreData,
    );
  }

  @override
  List<Object?> get props => [
        mySwapOrderStateStatus,
        sendSwapReqList,
        receiveSwapReqList,
        sendCurrentPage,
        receiveCurrentPage,
        isSendMoreData,
        isReceiveMoreData
      ];
}
