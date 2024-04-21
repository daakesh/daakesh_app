import '../../../../../src.export.dart';

abstract class SwapFilterEvent {}

class SwapPreviewSectionSubCategoriesEvent extends SwapFilterEvent {
  final int? catID;
  final bool? isFilterActive;
  final bool isSeeMore;

  SwapPreviewSectionSubCategoriesEvent({
    this.catID,
    this.isFilterActive,
    this.isSeeMore = false,
  });
}

class SwapSetFilterDataEvent extends SwapFilterEvent {
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SwapSetFilterDataEvent({
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class SwapClearFilterDataEvent extends SwapFilterEvent {}
