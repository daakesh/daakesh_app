import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class SwapBloc extends Bloc<SwapEvent, SwapState> {
  SwapBloc() : super(const SwapState()) {
    //on<SwapSetFilterDataEvent>(_setFilterDataEvent);
    on<SwapSelectProductPropertiesEvent>(_selectProductProperties);
    on<SwapGetSectionDataEvent>(_getSectionData);
    on<SwapDetermentTodayDealEvent>(_determentTodayDeal);
    on<SendOfferEvent>(_sendOffer);
  }

  static SwapBloc get get => BlocProvider.of(Utils.currentContext);

  ///Event to get Categories data at []
  FutureOr<void> _getSectionData(
      SwapGetSectionDataEvent event, Emitter<SwapState> emit) async {
    emit(state.copyWith(swapStateStatus: SwapStateStatus.LOADING));
    final result = await getIt.get<SwapUseCases>().getSectionData();
    result.fold((l) {
      emit(state.copyWith(swapStateStatus: SwapStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      SwapSectionModel sectionModel = SwapSectionModel.fromJson(r.data);
      List<SwapSectionItemModel> swapSectionListData =
          sectionModel.data!.data!.toList();
      emit(state.copyWith(
          swapStateStatus: SwapStateStatus.SUCCESS,
          swapSectionListData: swapSectionListData));
    });
  }

  ///Event to select product properties such as {Size, preview images ...etc}.
  FutureOr<void> _selectProductProperties(
      SwapSelectProductPropertiesEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(
      productSliderIndex: event.productSliderIndex,
      productSizeIndex: event.productSizeIndex,
    ));
  }

  ///In [], Specify today deal is [] or []
  /// by passing [isDaakeshTodayDeal] flag.
  FutureOr<void> _determentTodayDeal(
      SwapDetermentTodayDealEvent event, Emitter<SwapState> emit) {
    emit(state.copyWith(
      isDaakeshTodayDeal: event.isDaakeshTodayDeal,
    ));
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
      Utils.openNavNewPage(event.context, const ExchangeOfferScreen(),
          withNavBar: false);
      emit(state.copyWith(swapStateStatus: SwapStateStatus.SUCCESS));
    });
  }
}
