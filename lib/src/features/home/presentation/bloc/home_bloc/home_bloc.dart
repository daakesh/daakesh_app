import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../src.export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetSectionDataEvent>(_getSectionData);
    on<GetHomeScreenData>(_getHomeScreenData);
    on<SelectTabItemEvent>(_selectTabItem);
    on<ActivateSwapEvent>(_activateSwap);
  }
  static HomeBloc get get => BlocProvider.of(Utils.currentContext);
  static final controller = PersistentTabController();

  ///Event to swap between home screen states with widget like:
  /// [HomeDataWidget],[SearchScreen],[ResultsScreen],[CartScreen],[MoreInfoProductScreen]

  ///Event to get Categories data at [HomeDataWidget]
  FutureOr<void> _getSectionData(
      GetSectionDataEvent event, Emitter<HomeState> emit) async {
    if (event.isSeeMore) {
      if (state.isMoreData) {
        return;
      }
      emit(state.copyWith(
        sectionCurrentPage: state.sectionCurrentPage + 1,
        homeStateStatus: HomeStateStatus.LOADINGMORE,
      ));
    } else {
      emit(state.copyWith(
        homeStateStatus: HomeStateStatus.LOADING,
        sectionListData: [],
        sectionCurrentPage: 1,
      ));
    }
    final result = await getIt
        .get<HomeUseCases>()
        .getSectionData(state.sectionCurrentPage);
    result.fold((l) {
      emit(state.copyWith(homeStateStatus: HomeStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      SectionModel sectionModel = SectionModel.fromJson(r.data);
      int lastPage = sectionModel.data!.lastPage!;
      List<SectionItemModel> newResultList = sectionModel.data!.data!.toList();
      List<SectionItemModel> sectionListData = state.sectionListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          homeStateStatus: HomeStateStatus.NULL,
          isMoreData: lastPage == state.sectionCurrentPage,
        ));
        return;
      }
      sectionListData.addAll(newResultList);
      emit(state.copyWith(
        homeStateStatus: HomeStateStatus.SUCCESS,
        sectionListData: sectionListData,
        isMoreData: lastPage == state.sectionCurrentPage,
      ));
    });
  }

  FutureOr<void> _getHomeScreenData(
      GetHomeScreenData event, Emitter<HomeState> emit) {
    AdvBloc.get.add(GetAdvertisementDataEvent());
    HomeBloc.get.add(GetSectionDataEvent());
    HandmadeBloc.get.add(GetHandmadeDataEvent());
    BrandsBloc.get.add(GetBrandsDataEvent());
    TodayDealsBloc.get.add(GetToadyDealsDataEvent());
    OfferDealsBloc.get.add(GetAllOfferDealsEvent());
    //TodayDealsBloc.get.add(GetToadyDaakeshDealsDataEvent());
    if (ValueConstants.userId.isNotEmpty) {
      //CartBloc.get.add(GetCartItemsEvent());
      ContactInfoBloc.get.add(GetContactInfoEvent());
    }
  }

  FutureOr<void> _selectTabItem(
      SelectTabItemEvent event, Emitter<HomeState> emit) {
    if (event.index == 2) {
      //emit(state.copyWith(tabIndex: null));
    } else {
      emit(state.copyWith(tabIndex: event.index));
    }
  }

  FutureOr<void> _activateSwap(
      ActivateSwapEvent event, Emitter<HomeState> emit) async {
    if (controller.index == 2) {
      await Utils.showSwapOverLay(
          event.context,
          Utils.isEnglish
              ? Assets.png.shopModeEn.path
              : Assets.png.shopModeAr.path);
      controller.jumpToTab(0);
      emit(state.copyWith(tabIndex: 0));
    } else {
      await Utils.showSwapOverLay(
          event.context,
          Utils.isEnglish
              ? Assets.png.swapModeEn.path
              : Assets.png.swapModeAr.path);

      controller.jumpToTab(2);
    }
    emit(state.copyWith());
  }
}
