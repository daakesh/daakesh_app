import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapOrderBloc extends Bloc<MySwapOrderEvent, MySwapOrderState> {
  MySwapOrderBloc() : super(const MySwapOrderState()) {
    on<GetSendSwapRequestEvent>(_getSendSwapRequest);
    on<GetReceiveSwapRequestEvent>(_getReceiveSwapRequest);
    on<UpdateOfferEvent>(_acceptRejectSwapEvent);
    on<StartSwapEvent>(_startSwap);
  }
  static MySwapOrderBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getSendSwapRequest(
      GetSendSwapRequestEvent event, Emitter<MySwapOrderState> emit) async {
    emit(
        state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING));
    if (event.isSeeMore) {
      emit(state.copyWith(
        sendCurrentPage: state.sendCurrentPage + 1,
        mySwapOrderStateStatus: MySwapOrderStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING,
        sendSwapReqList: [],
        sendCurrentPage: 1,
      ));
    }
    final result = await getIt.get<MyOrderUseCases>().getSendReceiveSwapRequest(
        SwapRequestType.send.name, state.sendCurrentPage);
    result.fold((l) {
      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      SendReceiveSwapReqModel sendReceiveSwapReqModel =
          SendReceiveSwapReqModel.fromJson(r.data);
      int lastPage = sendReceiveSwapReqModel.data!.lastPage!;
      List<SendReceiveSwapReqItem> newResultList =
          sendReceiveSwapReqModel.data!.data!.toList();
      List<SendReceiveSwapReqItem> sendSwapReqList =
          state.sendSwapReqList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR,
          isSendMoreData: lastPage == state.sendCurrentPage,
        ));
        return;
      }
      sendSwapReqList.addAll(newResultList);
      emit(state.copyWith(
        mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS,
        sendSwapReqList: sendSwapReqList,
        isSendMoreData: lastPage == state.sendCurrentPage,
      ));
    });
  }

  FutureOr<void> _getReceiveSwapRequest(
      GetReceiveSwapRequestEvent event, Emitter<MySwapOrderState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        receiveCurrentPage: state.receiveCurrentPage + 1,
        mySwapOrderStateStatus: MySwapOrderStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING,
        receiveSwapReqList: [],
        receiveCurrentPage: 1,
      ));
    }
    final result = await getIt.get<MyOrderUseCases>().getSendReceiveSwapRequest(
        SwapRequestType.receive.name, state.receiveCurrentPage);
    result.fold((l) {
      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SendReceiveSwapReqModel sendReceiveSwapReqModel =
          SendReceiveSwapReqModel.fromJson(r.data);
      int lastPage = sendReceiveSwapReqModel.data!.lastPage!;
      List<SendReceiveSwapReqItem> newResultList =
          sendReceiveSwapReqModel.data!.data!.toList();
      List<SendReceiveSwapReqItem> receiveSwapReqList =
          state.receiveSwapReqList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR,
          isReceiveMoreData: lastPage == state.receiveCurrentPage,
        ));
        return;
      }
      receiveSwapReqList.addAll(newResultList);
      emit(state.copyWith(
        mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS,
        receiveSwapReqList: receiveSwapReqList,
        isReceiveMoreData: lastPage == state.receiveCurrentPage,
      ));
    });
  }

  FutureOr<void> _acceptRejectSwapEvent(
      UpdateOfferEvent event, Emitter<MySwapOrderState> emit) async {
    emit(
        state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result = await getIt
        .get<MyOrderUseCases>()
        .updateOffer(event.itemId, event.approved);
    result.fold((l) {
      ProgressCircleDialog.dismiss();

      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();

      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      state.receiveSwapReqList
          .removeWhere((element) => element.id == event.itemId);
      SendReceiveSwapReqItem sendReceiveSwapReqItem =
          SendReceiveSwapReqItem.fromJson(r.data['data']);
      state.receiveSwapReqList.add(sendReceiveSwapReqItem);
      emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS,
          receiveSwapReqList: state.receiveSwapReqList));
    });
  }

  FutureOr<void> _startSwap(
      StartSwapEvent event, Emitter<MySwapOrderState> emit) async {
    emit(
        state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result =
        await getIt.get<MyOrderUseCases>().startSwap(event.startSwapModel);
    result.fold((l) {
      ProgressCircleDialog.dismiss();

      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS));
    });
  }
}
