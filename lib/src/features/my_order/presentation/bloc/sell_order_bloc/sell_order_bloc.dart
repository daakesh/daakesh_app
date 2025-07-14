import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SellOrderBloc extends Bloc<SellOrderEvent, SellOrderState> {
  SellOrderBloc() : super(const SellOrderState()) {
    on<GetMyOrderEvent>(_getMyOrder);
  }
  static SellOrderBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getMyOrder(
      GetMyOrderEvent event, Emitter<SellOrderState> emit) async {
    emit(state.copyWith(sellOrderStateStatus: SellOrderStateStatus.LOADING));
    final result = await getIt.get<MyOrderUseCases>().getMyOrders();
    result.fold((l) {
      emit(state.copyWith(sellOrderStateStatus: SellOrderStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      MyOrderModel myOrderModel = MyOrderModel.fromJson(r.data);
      List<MyOrderData> myOrderDataList = myOrderModel.data!.toList();
      emit(state.copyWith(
          sellOrderStateStatus: SellOrderStateStatus.SUCCESS,
          myOrderDataList: myOrderDataList));
    });
  }
}
