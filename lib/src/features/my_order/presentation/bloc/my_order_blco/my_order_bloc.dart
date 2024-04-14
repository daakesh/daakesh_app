import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(const MyOrderState()) {
    on<ToggleMyOrderTabBarEvent>(_toggleMyOrderTabBar);
    on<SendReceiveSwitchEvent>(_sendReceiveSwitch);
  }
  static MyOrderBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _toggleMyOrderTabBar(
      ToggleMyOrderTabBarEvent event, Emitter<MyOrderState> emit) {
    emit(state.copyWith(myOrderTapBar: event.myOrderTapBar));
  }

  FutureOr<void> _sendReceiveSwitch(
      SendReceiveSwitchEvent event, Emitter<MyOrderState> emit) {
    emit(state.copyWith(sendReceiveFlag: event.sendReceiveFlag));
  }
}
