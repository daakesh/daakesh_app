import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SwapHomeScreenStateEvent>(_swapHomeScreenState);
    on<DetermentTodayDealEvent>(_determentTodayDeal);
    on<SetFilterDataEvent>(_setFilterDataEvent);
    on<SelectProductPropertiesEvent>(_selectProductProperties);
    on<GetSectionDataEvent>(_getSectionData);
    on<GetHandmadeDataEvent>(_getHandmadeData);
    on<GetBrandsDataEvent>(_getBrandsData);
    on<GetTodayItemsDataEvent>(_getTodayItemsData);
    on<GetAdvertisementDataEvent>(_getAdvertisementData);
  }
  static HomeBloc get get => BlocProvider.of(navigatorKey.currentState!.context);
  ///Event to swap between home screen states with widget like:
  /// [HomeDataWidget],[SearchScreen],[ResultsScreen],[CartScreen],[MoreInfoProductScreen]
  FutureOr<void> _swapHomeScreenState(SwapHomeScreenStateEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeScreenState: event.homeScreenState));
  }
  ///In [HomeDataWidget], Specify today deal is [DaakeshTodayDealProduct] or [TodayDealProduct]
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(DetermentTodayDealEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
  }
  ///Event to insert [FilterScreen] data.
  FutureOr<void> _setFilterDataEvent(SetFilterDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      rateIndex: event.rateTypeIndex,
      productTypeIndex: event.productTypeIndex,
    ));
  }
  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(SelectProductPropertiesEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex:event.productSizeIndex,
    ));
  }
  ///Event to get Categories data at [HomeDataWidget]
  FutureOr<void> _getSectionData(GetSectionDataEvent event, Emitter<HomeState> emit)async{
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getSectionData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SectionModel sectionModel = SectionModel.fromJson(r.data);
      List<SectionItemModel> sectionListData = sectionModel.data!.data!.toList();
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,sectionListData:sectionListData));
    });
  }
  ///Event to get Handmade data at [HomeDataWidget]
  FutureOr<void> _getHandmadeData(GetHandmadeDataEvent event, Emitter<HomeState> emit)async {
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getHandmadeData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,));
    });
  }
  ///Event to get Brands data at [HomeDataWidget]
  FutureOr<void> _getBrandsData(GetBrandsDataEvent event, Emitter<HomeState> emit)async{
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getBrandsData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,));
    });
  }

  FutureOr<void> _getTodayItemsData(GetTodayItemsDataEvent event, Emitter<HomeState> emit)async {
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getTodayItemsData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,));
    });
  }

  FutureOr<void> _getAdvertisementData(GetAdvertisementDataEvent event, Emitter<HomeState> emit) async{
    emit(state.copyWith(homeStateStatus:  HomeStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getAdvertisementData();
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async{
      if(!r.status!){
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(homeStateStatus: HomeStateStatus.SUCCESS,));
    });
  }
}
