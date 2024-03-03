import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HandmadeBloc extends Bloc<HandmadeEvent, HandmadeState> {
  HandmadeBloc() : super(const HandmadeState()) {
    on<GetHandmadeDataEvent>(_getHandmadeData);
  }
  static HandmadeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getHandmadeData(GetHandmadeDataEvent event, Emitter<HandmadeState> emit) async{
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        handmadeStateStatus:HandmadeStateStatus.LOADINGMORE,
      ));
    }
    else{
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.LOADING,
        handmadeListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getHandmadeData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(handmadeStateStatus: HandmadeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      HandmadeModel handmadeModel = HandmadeModel.fromJson(r.data);
      int lastPage = handmadeModel.data!.lastPage!;
      List<HandmadeItem> newResultList = handmadeModel.data!.handmadeItemList!.toList();
      List<HandmadeItem> handmadeListData = state.handmadeListData.toList();
      if(newResultList.isEmpty){
        emit(state.copyWith(
          handmadeStateStatus: HandmadeStateStatus.NULL,
          isMoreData:lastPage == state.currentPage,
        ));
        return;
      }
      handmadeListData.addAll(newResultList);
      emit(state.copyWith(
        handmadeStateStatus: HandmadeStateStatus.SUCCESS,
        handmadeListData:  handmadeListData,
        isMoreData:lastPage == state.currentPage,
      ));
    });

  }


}


