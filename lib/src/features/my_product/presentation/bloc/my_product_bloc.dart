import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {
  MyProductBloc() : super(const MyProductState()) {
    on<SwapTabBarProductTypeEvent>(_swapTabBarProductType);
  }
  static MyProductBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  Future<FutureOr<void>> _swapTabBarProductType(SwapTabBarProductTypeEvent event, Emitter<MyProductState> emit) async {
    emit(state.copyWith(productTapBar: event.productTapBar));
  }




}
