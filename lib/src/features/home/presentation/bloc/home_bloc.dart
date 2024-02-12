import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(_handleEvent);
  }
  static HomeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  Future<FutureOr<void>> _handleEvent(HomeEvent event, Emitter<HomeState> emit) async {

    ///Home Screen event
    if(event is SearchOnOffEvent){
      emit(state.copyWith(
        isSearchOn: event.isSearchOn,
        isProductDetailsOn: false,
        isShowSearchResult: false,
        isShowCart:false,
      ));
    }
    if(event is ShowMoreProductDetailsEvent) {
      emit(state.copyWith(
        isProductDetailsOn: event.isProductDetailsOn,
        isDaakeshTodayDeal: event.isDaakeshTodayDeal,
        isSearchOn: false,
        productSizeIndex: 0,
        productSliderIndex: 0,
        isShowSearchResult: false,
        isShowCart:false,
      ));
    }
    if(event is ShowSearchResultEvent){
      emit(state.copyWith(
          isSearchOn: false,
          isShowSearchResult:event.isShowSearchResult
      ));
    }
    if(event is ShowCartEvent){
      emit(state.copyWith(
          isSearchOn: false,
          isProductDetailsOn: false,
          isShowSearchResult: false,
          isShowCart:event.isShowCart
      ));
    }


    ///Filter Screen event
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


    ///More Info Product Screen
    if(event is ChangeProductSliderIndexEvent){
      emit(state.copyWith(
        productSliderIndex: event.sliderIndex,
      ));
    }
    if(event is SelectProductSizeIndex){
      emit(state.copyWith(
        productSizeIndex: event.productSizeIndex,
      ));
    }


  }
}
