import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapRateBloc extends Bloc<SwapRateEvent, SwapRateState> {
  SwapRateBloc() : super(const SwapRateState()) {
    on<SwapAddRateEvent>(_addRate);
    on<SwapGetRateByItemEvent>(_getRateByItem);
    on<SwapEditRateEvent>(_editRate);
  }
  static SwapRateBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _addRate(
      SwapAddRateEvent event, Emitter<SwapRateState> emit) async {
    int itemId = event.itemId;
    int userId = event.userId;
    int catID = event.catID;
    int rateValue = event.rateValue;
    emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.LOADING));
    final result = await getIt
        .get<SwapUseCases>()
        .addRate(itemId, userId, catID, rateValue);
    result.fold((l) {
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getRateByItem(
      SwapGetRateByItemEvent event, Emitter<SwapRateState> emit) async {
    int itemID = event.itemId;
    int userId = event.userId;
    emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.LOADING));
    final result =
        await getIt.get<SwapUseCases>().getRateByItem(itemID, userId);
    result.fold((l) {
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _editRate(
      SwapEditRateEvent event, Emitter<SwapRateState> emit) async {
    int id = event.id;
    int rateValue = event.rateValue;
    emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().editRate(id, rateValue);
    result.fold((l) {
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      emit(state.copyWith(swapRateStateStatus: SwapRateStateStatus.SUCCESS));
    });
  }
}
