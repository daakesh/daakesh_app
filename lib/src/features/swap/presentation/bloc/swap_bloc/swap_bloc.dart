import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc() : super(const SwapState()) {
    //on<SwapSetFilterDataEvent>(_setFilterDataEvent);
    on<SwapGetSectionDataEvent>(_getSectionData);
    on<SendOfferEvent>(_sendOffer);
    on<ClickSwapAdvEvent>(_clickSwapAdv);
  }

  static SwapBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Categories data at []
  FutureOr<void> _getSectionData(
      SwapGetSectionDataEvent event, Emitter<SwapState> emit) async {
    if (event.isSeeMore) {
      if (state.isMoreData) {
        return;
      }
      emit(state.copyWith(
        sectionCurrentPage: state.sectionCurrentPage + 1,
        swapStateStatus: SwapStateStatus.LODAINGMORE,
      ));
    } else {
      emit(state.copyWith(
        swapStateStatus: SwapStateStatus.LODAINGMORE,
        swapSectionListData: [],
        sectionCurrentPage: 1,
      ));
    }
    final result = await getIt
        .get<SwapUseCases>()
        .getSectionData(state.sectionCurrentPage);
    result.fold((l) {
      emit(state.copyWith(swapStateStatus: SwapStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SwapSectionModel sectionModel = SwapSectionModel.fromJson(r.data);
      int lastPage = sectionModel.data!.lastPage!;
      List<SwapSectionItemModel> newResultList =
          sectionModel.data!.data!.toList();
      List<SwapSectionItemModel> swapSectionListData =
          state.swapSectionListData.toList();
      if (newResultList.isEmpty) {
        emit(state.copyWith(
          swapStateStatus: SwapStateStatus.SUCCESS,
          isMoreData: lastPage == state.sectionCurrentPage,
        ));
        return;
      }
      swapSectionListData.addAll(newResultList);
      emit(state.copyWith(
        swapStateStatus: SwapStateStatus.SUCCESS,
        swapSectionListData: swapSectionListData,
        isMoreData: lastPage == state.sectionCurrentPage,
      ));
    });
  }

  FutureOr<void> _sendOffer(
      SendOfferEvent event, Emitter<SwapState> emit) async {
    String sourceItem = event.sourceItem;
    String offerItem = event.offerItem;
    String comment = event.comment;
    String sourceUser = event.sourceUser;
    String offerUser = event.offerUser;
    emit(state.copyWith(swapStateStatus: SwapStateStatus.LOADING));

    ProgressCircleDialog.show();
    final result = await getIt
        .get<SwapUseCases>()
        .sendOffer(sourceItem, offerItem, comment, sourceUser, offerUser);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(swapStateStatus: SwapStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      Utils.openNavNewPage(
          event.context,
          ExchangeOfferScreen(
            trendDealsItem: event.trendDealsItem,
          ),
          withNavBar: false);
      emit(state.copyWith(swapStateStatus: SwapStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _clickSwapAdv(
      ClickSwapAdvEvent event, Emitter<SwapState> emit) async {
    emit(state.copyWith(swapStateStatus: SwapStateStatus.LOADING));
    final result = await getIt
        .get<SwapUseCases>()
        .clickAdv(ValueConstants.userId, event.advID);
    result.fold((l) {
      emit(state.copyWith(swapStateStatus: SwapStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      emit(state.copyWith(
        swapStateStatus: SwapStateStatus.SUCCESS,
      ));
    });
  }
}
