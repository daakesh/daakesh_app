import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  RateBloc() : super(const RateState()) {
    on<AddRateEvent>(_addRate);
    on<GetRateByItemEvent>(_getRateByItem);
    on<EditRateEvent>(_editRate);
    on<GetOverAllRateItemsEvent>(_getOverAllRateItems);
    on<EmptyDataEvent>(_emptyDataEvent);
  }
  static RateBloc get get =>
      BlocProvider.of(Utils.navigatorKey.currentState!.context);

  FutureOr<void> _addRate(AddRateEvent event, Emitter<RateState> emit) async {
    int itemId = event.itemId;
    String userId = event.userId;
    int catID = event.catID;
    double rateValue = event.rateValue;
    emit(state.copyWith(rateStateStatus: RateStateStatus.LOADING));
    final result = await getIt
        .get<HomeUseCases>()
        .addRate(itemId, userId, catID, rateValue);
    result.fold((l) {
      emit(state.copyWith(rateStateStatus: RateStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(rateStateStatus: RateStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getRateByItem(
      GetRateByItemEvent event, Emitter<RateState> emit) async {
    int itemID = event.itemId;
    int userId = event.userId;
    emit(state.copyWith(rateStateStatus: RateStateStatus.LOADING));
    final result =
        await getIt.get<HomeUseCases>().getRateByItem(itemID, userId);
    result.fold((l) {
      emit(state.copyWith(rateStateStatus: RateStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(rateStateStatus: RateStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _editRate(EditRateEvent event, Emitter<RateState> emit) async {
    int id = event.id;
    int rateValue = event.rateValue;
    emit(state.copyWith(rateStateStatus: RateStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().editRate(id, rateValue);
    result.fold((l) {
      emit(state.copyWith(rateStateStatus: RateStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(rateStateStatus: RateStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getOverAllRateItems(
      GetOverAllRateItemsEvent event, Emitter<RateState> emit) async {
    int itemID = event.itemID;
    emit(state.copyWith(rateStateStatus: RateStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getOverAllRateItem(itemID);
    result.fold((l) {
      emit(state.copyWith(rateStateStatus: RateStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      OverAllRateModel overAllRateModel = OverAllRateModel.fromJson(r.data);
      emit(state.copyWith(
        rateStateStatus: RateStateStatus.SUCCESS,
        rateAverage: overAllRateModel.data!.average,
      ));
    });
  }

  FutureOr<void> _emptyDataEvent(
      EmptyDataEvent event, Emitter<RateState> emit) {
    emit(state.copyWith(rateAverage: 0.0));
  }
}
