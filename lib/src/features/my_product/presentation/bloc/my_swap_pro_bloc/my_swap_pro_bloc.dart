import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapProBloc extends Bloc<MySwapProEvent, MySwapProState> {
  MySwapProBloc() : super(const MySwapProState()) {
    on<GetMySwapProEvent>(_getMySwapPro);
    on<ClearSwapDataEvent>(_clearSwapData);
    on<RemoveSwapItemEvent>(_removeSwapItem);
  }
  static MySwapProBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getMySwapPro(
      GetMySwapProEvent event, Emitter<MySwapProState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        mySwapProStateStatus: MySwapProStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        mySwapProStateStatus: MySwapProStateStatus.LOADING,
        myProductListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt
        .get<MyProductUseCases>()
        .getMyProduct(state.currentPage, UserType.SWAP.name);

    result.fold((l) {
      emit(state.copyWith(mySwapProStateStatus: MySwapProStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      MyProductModel myProductModel = MyProductModel.fromJson(r.data);
      int lastPage = myProductModel.data!.lastPage!;
      List<MyProductItem> newResultList =
          myProductModel.data!.myProductListData!.toList();
      List<MyProductItem> myProductListData =
          state.mySwapProductListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          mySwapProStateStatus: MySwapProStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      myProductListData.addAll(newResultList);
      emit(state.copyWith(
        mySwapProStateStatus: MySwapProStateStatus.SUCCESS,
        myProductListData: myProductListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _clearSwapData(
      ClearSwapDataEvent event, Emitter<MySwapProState> emit) {
    emit(state.copyWith(
      myProductListData: [],
      isMoreData: true,
    ));
  }

  FutureOr<void> _removeSwapItem(
      RemoveSwapItemEvent event, Emitter<MySwapProState> emit) async {
    ProgressCircleDialog.show();
    final result = await getIt.get<MyProductUseCases>().removeProduct(event.id);
    result.fold((l) {
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      ShowToastSnackBar.showCustomDialog(message: r.data['data'].toString());
      List<MyProductItem> cartItemsList = state.mySwapProductListData.toList();
      cartItemsList.removeWhere((item) => event.id == item.id);
      emit(state.copyWith(myProductListData: []));
      emit(state.copyWith(myProductListData: cartItemsList));
    });
  }
}
