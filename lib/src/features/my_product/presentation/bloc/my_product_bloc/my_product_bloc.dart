import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class MyProBloc extends Bloc<MyProEvent, MyProState> {
  MyProBloc() : super(const MyProState()) {
    on<GetMyProductEvent>(_getMyProduct);
  }
  static MyProBloc get get => BlocProvider.of(navigatorKey.currentState!.context);

  FutureOr<void> _getMyProduct(GetMyProductEvent event, Emitter<MyProState> emit) async{
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        myProStateStatus:MyProStateStatus.LOADINGMORE,
      ));
    }
    else{
      emit(state.copyWith(
        myProStateStatus:  MyProStateStatus.LOADING,
        myProductListData:  [],
        currentPage: 1,
      ));
    }

    final result = await getIt.get<MyProductUseCases>().getMyProduct(state.currentPage,UserType.SELL.name);

    result.fold((l) {
      emit(state.copyWith(myProStateStatus: MyProStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      MyProductModel myProductModel =MyProductModel.fromJson(r.data);
      int lastPage = myProductModel.data!.lastPage!;
      List<MyProductItem> newResultList = myProductModel.data!.myProductListData!.toList();
      List<MyProductItem> myProductListData= state.myProductListData.toList();
      if(newResultList.isEmpty){
        emit(state.copyWith(
          myProStateStatus: MyProStateStatus.NULL,
          isMoreData:lastPage == state.currentPage,
        ));
        return;
      }
      myProductListData.addAll(newResultList);
      emit(state.copyWith(
        myProStateStatus: MyProStateStatus.SUCCESS,
        myProductListData:  myProductListData,
        isMoreData:lastPage == state.currentPage,
      ));
    });
  }

}
