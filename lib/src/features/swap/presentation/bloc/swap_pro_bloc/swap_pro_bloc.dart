import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapProBloc extends Bloc<SwapProEvent, SwapProState> {
  SwapProBloc() : super(const SwapProState()) {
    on<GetSwapProductEvent>(_getSwapProductEvent);
    on<ResetMySwapItemDataEvent>(_resetMySwapItemData);
  }
  static SwapProBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getSwapProductEvent(
      GetSwapProductEvent event, Emitter<SwapProState> emit) async {
    if (event.isSeeMore) {
      if (state.isMoreData) {
        return;
      }
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        swapProStateStatus: SwapProStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        swapProStateStatus: SwapProStateStatus.LOADING,
        mySwapProductListData: [],
        currentPage: 1,
      ));
    }

    final result =
        await getIt.get<SwapUseCases>().getMySwapProduct(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(swapProStateStatus: SwapProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      MyProductModel mySwapProductModel = MyProductModel.fromJson(r.data);
      int lastPage = mySwapProductModel.data!.lastPage!;
      List<MyProductItem> newResultList =
          mySwapProductModel.data!.myProductListData!.toList();
      List<MyProductItem> mySwapProductListData =
          state.mySwapProductListData.toList();
      SwapPassDataBloc.get.add(
          PassMySwapProductListEvent(mySwapProductData: mySwapProductListData));
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapProStateStatus: SwapProStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }

      mySwapProductListData.addAll(newResultList);

      emit(
        state.copyWith(
          swapProStateStatus: SwapProStateStatus.SUCCESS,
          mySwapProductListData: mySwapProductListData,
          isMoreData: lastPage == state.currentPage,
        ),
      );
    });
  }

  FutureOr<void> _resetMySwapItemData(
      ResetMySwapItemDataEvent event, Emitter<SwapProState> emit) {
    emit(state.copyWith(
      swapProStateStatus: SwapProStateStatus.INITIAL,
      mySwapProductListData: [],
      currentPage: 1,
      isMoreData: true,
    ));
  }
}
