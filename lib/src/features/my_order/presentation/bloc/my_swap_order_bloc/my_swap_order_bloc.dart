import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapOrderBloc extends Bloc<MySwapOrderEvent, MySwapOrderState> {
  MySwapOrderBloc() : super(const MySwapOrderState()) {
    on<GetSendSwapRequestEvent>(_getSendSwapRequest);
    on<GetReceiveSwapRequestEvent>(_getReceiveSwapRequest);
  }
  static MySwapOrderBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getSendSwapRequest(
      GetSendSwapRequestEvent event, Emitter<MySwapOrderState> emit) async {
    emit(
        state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING));
    final result = await getIt
        .get<MyOrderUseCases>()
        .getSendReceiveSwapRequest(SwapRequestType.send.name);
    result.fold((l) {
      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SendReceiveSwapReqModel sendSwapReqModel =
          SendReceiveSwapReqModel.fromJson(r.data);
      List<SendReceiveSwapReqItem> sendSwapReqList =
          sendSwapReqModel.data!.data!.toList();

      emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS,
          sendSwapReqList: sendSwapReqList));
    });
  }

  FutureOr<void> _getReceiveSwapRequest(
      GetReceiveSwapRequestEvent event, Emitter<MySwapOrderState> emit) async {
    emit(
        state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.LOADING));
    final result = await getIt
        .get<MyOrderUseCases>()
        .getSendReceiveSwapRequest(SwapRequestType.receive.name);
    result.fold((l) {
      emit(
          state.copyWith(mySwapOrderStateStatus: MySwapOrderStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SendReceiveSwapReqModel receiveSwapReqModel =
          SendReceiveSwapReqModel.fromJson(r.data);
      List<SendReceiveSwapReqItem> receiveSwapReqList =
          receiveSwapReqModel.data!.data!.toList();
      emit(state.copyWith(
          mySwapOrderStateStatus: MySwapOrderStateStatus.SUCCESS,
          receiveSwapReqList: receiveSwapReqList));
    });
  }
}
