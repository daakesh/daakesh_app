import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AdvBloc extends Bloc<AdvEvent, AdvState> {
  AdvBloc() : super(const AdvState()) {
    on<GetAdvertisementDataEvent>(_getAdvertisementData);
  }
  static AdvBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get ADV data to display it into slider at [HomeDataWidget]
  FutureOr<void> _getAdvertisementData(
      GetAdvertisementDataEvent event, Emitter<AdvState> emit) async {
    emit(state.copyWith(advStateStatus: AdvStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getAdvertisementData();
    result.fold((l) {
      emit(state.copyWith(advStateStatus: AdvStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      AdvModel advModel = AdvModel.fromJson(r.data);
      emit(state.copyWith(
          advStateStatus: AdvStateStatus.SUCCESS,
          advListData: advModel.data!.toList()));
    });
  }
}
