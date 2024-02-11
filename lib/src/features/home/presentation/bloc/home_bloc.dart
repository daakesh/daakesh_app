import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(_handleEvent);
  }
  static HomeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  Future<FutureOr<void>> _handleEvent(HomeEvent event, Emitter<HomeState> emit) async {

    if(event is SearchOnOffEvent){
      emit(state.copyWith(
        isSearchOn: event.isSearchOn,
        isProductDetailsOn: false,
      ));
    }

    if(event is ChangeRateTypeEvent){
      emit(state.copyWith(
        rateIndex: event.index,
      ));
    }

    if (event is SelectProductTypeEvent) {
      emit(state.copyWith(
        productIndex: event.index,
      ));
    }

    if (event is ShowMoreProductDetails) {
      emit(state.copyWith(
        isProductDetailsOn: event.isProductDetailsOn,
        isDaakeshTodayDeal: event.isDaakeshTodayDeal,
        isSearchOn: false,
      ));
    }
    if(event is ChangeProductSliderIndex){
      emit(state.copyWith(
        productSliderIndex: event.index,

      ));
    }


  }
}
