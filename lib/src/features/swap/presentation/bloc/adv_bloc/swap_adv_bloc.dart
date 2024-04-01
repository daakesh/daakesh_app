import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapAdvBloc extends Bloc<SwapAdvEvent, SwapAdvState> {
  SwapAdvBloc() : super(const SwapAdvState()) {
    on<SwapGetAdvertisementDataEvent>(_getAdvertisementData);
  }
  static SwapAdvBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _getAdvertisementData(
      SwapGetAdvertisementDataEvent event, Emitter<SwapAdvState> emit) async {
    emit(state.copyWith(swapAdvStateStatus: SwapAdvStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().getAdvertisementData();
    result.fold((l) {
      emit(state.copyWith(swapAdvStateStatus: SwapAdvStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SwapAdvModel swapAdvModel = SwapAdvModel.fromJson(r.data);
      emit(state.copyWith(
          swapAdvStateStatus: SwapAdvStateStatus.SUCCESS,
          swapAdvListData: swapAdvModel.data!.toList()));
    });
  }
}
