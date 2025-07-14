import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class AdvBloc extends Bloc<AdvEvent, AdvState> {
  AdvBloc() : super(const AdvState()) {
    on<GetAdvertisementDataEvent>(_getAdvertisementData);
    on<ClickAdvEvent>(_clickAdv);
  }
  static AdvBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get ADV data to display it into slider at [HomeDataWidget]
  FutureOr<void> _getAdvertisementData(
      GetAdvertisementDataEvent event, Emitter<AdvState> emit) async {
    emit(state.copyWith(advStateStatus: AdvStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getAdvertisementData();
    result.fold((l) {
      emit(state.copyWith(advStateStatus: AdvStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      AdvModel advModel = AdvModel.fromJson(r.data);
      emit(state.copyWith(
          advStateStatus: AdvStateStatus.SUCCESS,
          advListData: advModel.data!.toList()));
    });
  }

  FutureOr<void> _clickAdv(ClickAdvEvent event, Emitter<AdvState> emit) async {
    emit(state.copyWith(advStateStatus: AdvStateStatus.LOADING));
    final result = await getIt
        .get<HomeUseCases>()
        .clickAdv(ValueConstants.userId, event.advId);
    result.fold((l) {
      emit(state.copyWith(advStateStatus: AdvStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      emit(state.copyWith(advStateStatus: AdvStateStatus.SUCCESS));
    });
  }
}
