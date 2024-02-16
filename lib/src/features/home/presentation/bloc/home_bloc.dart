import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SwapHomeScreenStateEvent>(_swapHomeScreenState);
    on<DetermentTodayDealEvent>(_determentTodayDeal);
    on<SetFilterDataEvent>(_setFilterDataEvent);
    on<SelectProductPropertiesEvent>(_selectProductProperties);
  }
  static HomeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to swap between home screen states with widget like:
  /// [HomeDataWidget],[SearchScreen],[ResultsScreen],[CartScreen],[MoreInfoProductScreen]
  FutureOr<void> _swapHomeScreenState(SwapHomeScreenStateEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeScreenState: event.homeScreenState));
  }
  ///In [HomeDataWidget], Specify today deal is [DaakeshTodayDealProduct] or [TodayDealProduct]
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(DetermentTodayDealEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
  }
  ///Event to insert [FilterScreen] data.
  FutureOr<void> _setFilterDataEvent(SetFilterDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      rateIndex: event.rateTypeIndex,
      productTypeIndex: event.productTypeIndex,
    ));
  }
  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(SelectProductPropertiesEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex:event.productSizeIndex,
    ));
  }


}
