import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapProBloc extends Bloc<SwapProEvent, SwapProState> {
  SwapProBloc() : super(const SwapProState()) {
    on<GetSwapProductEvent>(_getSwapProductEvent);
  }
  static SwapProBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getSwapProductEvent(
      GetSwapProductEvent event, Emitter<SwapProState> emit) async {
    emit(state.copyWith(swapProStateStatus: SwapProStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().getMySwapProduct(1);
    result.fold((l) {
      emit(state.copyWith(swapProStateStatus: SwapProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      MyProductModel mySwapProductModel = MyProductModel.fromJson(r.data);
      List<MyProductItem> mySwapProductListData =
          mySwapProductModel.data!.myProductListData!.toList();
      SwapPassDataBloc.get.add(
          PassMySwapProductListEvent(mySwapProductData: mySwapProductListData));
      emit(state.copyWith(
          swapProStateStatus: SwapProStateStatus.SUCCESS,
          mySwapProductListData: mySwapProductListData));
    });
  }
}
