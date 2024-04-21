import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MySwapProBloc extends Bloc<MySwapProEvent, MySwapProState> {
  MySwapProBloc() : super(const MySwapProState()) {
    on<GetMySwapProEvent>(_getMySwapPro);
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
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
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
}
