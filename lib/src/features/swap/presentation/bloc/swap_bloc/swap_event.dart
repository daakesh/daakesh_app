import 'package:flutter/material.dart';

abstract class SwapEvent {}

class SwapGetToTopScreenEvent extends SwapEvent {}

class SwapDetermentTodayDealEvent extends SwapEvent {
  final bool isDaakeshTodayDeal;
  SwapDetermentTodayDealEvent({required this.isDaakeshTodayDeal});
}

// class SwapSetFilterDataEvent extends SwapEvent {
//   final int? rateTypeIndex;
//   final int? productTypeIndex;

//   SwapSetFilterDataEvent({
//     this.rateTypeIndex,
//     this.productTypeIndex,
//   });
// }

class SwapSelectProductPropertiesEvent extends SwapEvent {
  final int? productSliderIndex;
  final int? productSizeIndex;

  SwapSelectProductPropertiesEvent({
    this.productSliderIndex,
    this.productSizeIndex,
  });
}

class SwapSelectProductSizeIndex extends SwapEvent {
  final int productSizeIndex;
  SwapSelectProductSizeIndex({required this.productSizeIndex});
}

class SwapGetSectionDataEvent extends SwapEvent {
  final bool isSeeMore;

  SwapGetSectionDataEvent({this.isSeeMore = false});
}

class SwapGetTodayItemsDataEvent extends SwapEvent {}

class SendOfferEvent extends SwapEvent {
  final BuildContext context;
  final String sourceItem;
  final String offerItem;
  final String comment;
  final String sourceUser;
  final String offerUser;

  SendOfferEvent({
    required this.context,
    required this.sourceItem,
    required this.offerItem,
    required this.comment,
    required this.sourceUser,
    required this.offerUser,
  });
}
