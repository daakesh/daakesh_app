import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  BrandsBloc() : super(const BrandsState()) {
    on<GetBrandsDataEvent>(_getBrandsData);
    on<GetItemsByBrandsEvent>(_getItemsByBrands);
    on<ResetValueEvent>(_resetValue);
  }
  static BrandsBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getBrandsData(
      GetBrandsDataEvent event, Emitter<BrandsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        currentPage: state.currentPage + 1,
        brandsStateStatus: BrandsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.LOADING,
        brandListData: [],
        currentPage: 1,
      ));
    }

    final result =
        await getIt.get<HomeUseCases>().getBrandsData(state.currentPage);
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      BrandModel brandModel = BrandModel.fromJson(r.data);
      int lastPage = brandModel.data!.lastPage!;
      List<BrandItem> newResultList = brandModel.data!.brandItemList!.toList();
      List<BrandItem> brandListData = state.brandListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.NULL,
          isMoreData: lastPage == state.currentPage,
        ));
        return;
      }
      brandListData.addAll(newResultList);
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.SUCCESS,
        brandListData: brandListData,
        isMoreData: lastPage == state.currentPage,
      ));
    });
  }

  FutureOr<void> _getItemsByBrands(
      GetItemsByBrandsEvent event, Emitter<BrandsState> emit) async {
    if (event.isSeeMore) {
      emit(state.copyWith(
        itemsCurrentPage: state.itemsCurrentPage + 1,
        brandsStateStatus: BrandsStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.LOADING,
        itemByBrandList: [],
        brandID: event.brandID,
        itemsCurrentPage: 1,
      ));
    }

    final result = await getIt.get<HomeUseCases>().getItemsByBrands(
          state.itemsCurrentPage,
          state.brandID,
        );
    result.fold((l) {
      emit(state.copyWith(brandsStateStatus: BrandsStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      TodayItemModel todayItemModel = TodayItemModel.fromJson(r.data);
      int lastPage = todayItemModel.data!.lastPage!;
      List<TodayItem> newResultList =
          todayItemModel.data!.todayItemList!.toList();
      List<TodayItem> todayItemData = state.itemByBrandList.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          brandsStateStatus: BrandsStateStatus.NULL,
          isMoreDataItems: lastPage == state.currentPage,
        ));
        return;
      }
      todayItemData.addAll(newResultList);
      emit(state.copyWith(
        brandsStateStatus: BrandsStateStatus.SUCCESS,
        itemByBrandList: todayItemData,
        isMoreDataItems: lastPage == state.itemsCurrentPage,
      ));
    });
  }

  FutureOr<void> _resetValue(ResetValueEvent event, Emitter<BrandsState> emit) {
    emit(state.copyWith(
      itemByBrandList: [],
      isMoreDataItems: true,
    ));
  }
}
