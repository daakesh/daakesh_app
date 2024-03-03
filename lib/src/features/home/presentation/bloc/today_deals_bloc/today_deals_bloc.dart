import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class TodayDealsBloc extends Bloc<TodayDealsEvent, TodayDealsState> {
  TodayDealsBloc() : super(const TodayDealsState()) {
    on<GetToadyDealsDataEvent>(_getTodayDealsData);
  }

  static TodayDealsBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getTodayDealsData(GetToadyDealsDataEvent event, Emitter<TodayDealsState> emit) async{
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        todayDealsStateStatus:TodayDealsStateStatus.LOADINGMORE,
      ));
    }
    else{
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.LOADING,
        todayDealsListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getTodayItemsData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(todayDealsStateStatus: TodayDealsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      HandmadeModel brandModel = HandmadeModel.fromJson(r.data);
      int lastPage = brandModel.data!.lastPage!;
      List<HandmadeItem> newResultList = brandModel.data!.handmadeItemList!.toList();
      List<HandmadeItem> handmadeListData = state.todayDealsListData.toList();
      if(newResultList.isEmpty){
        emit(state.copyWith(
          todayDealsStateStatus: TodayDealsStateStatus.NULL,
          isMoreData:lastPage == state.currentPage,
        ));
        return;
      }
      handmadeListData.addAll(newResultList);
      emit(state.copyWith(
        todayDealsStateStatus: TodayDealsStateStatus.SUCCESS,
        todayDealsListData:  handmadeListData,
        isMoreData:lastPage == state.currentPage,
      ));
    });

  }

}


