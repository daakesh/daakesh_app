import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  BrandsBloc() : super(const BrandsState()) {
    on<GetBrandsDataEvent>(_getBrandsData);
  }
  static BrandsBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getBrandsData(GetBrandsDataEvent event, Emitter<BrandsState> emit) async{

    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        brandsStateStatus:BrandsStateStatus.LOADINGMORE,
      ));
    }
    else{
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.LOADING,
        brandListData: [],
        currentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getBrandsData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      BrandModel brandModel = BrandModel.fromJson(r.data);
      int lastPage = brandModel.data!.lastPage!;
      List<BrandItem> newResultList = brandModel.data!.brandItemList!.toList();
      List<BrandItem> brandListData = state.brandListData.toList();
      if(newResultList.isEmpty){
        emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.NULL,
          isMoreData:lastPage == state.currentPage,
        ));
        return;
      }
      brandListData.addAll(newResultList);
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.SUCCESS,
        brandListData:  brandListData,
        isMoreData:lastPage == state.currentPage,
      ));
    });

  }


}


