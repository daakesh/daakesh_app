import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  ShippingBloc() : super(const ShippingState()) {
    on<SelectShippingCountryFlagEvent>(_changeShippingFlag);
    on<SelectShippingPhoneNumberEvent>(_selectShippingPhoneNumber);
  }
  static ShippingBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _changeShippingFlag(
      SelectShippingCountryFlagEvent event, Emitter<ShippingState> emit) {
    emit(state.copyWith(shippingFlag: event.flagEmoji));
  }

  FutureOr<void> _selectShippingPhoneNumber(
      SelectShippingPhoneNumberEvent event, Emitter<ShippingState> emit) {
    emit(state.copyWith(
      phoneNumberFlag: event.flagEmoji,
      phoneNumberCode: event.phoneCode,
    ));
  }
}
