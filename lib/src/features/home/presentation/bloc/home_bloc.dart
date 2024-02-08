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
      emit(state.copyWith(isSearchOn: event.isSearchOn));
    }



    

  }
}
