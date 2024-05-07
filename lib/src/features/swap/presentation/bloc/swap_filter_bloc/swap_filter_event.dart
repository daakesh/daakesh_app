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
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SwapSetFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class SwapClearFilterDataEvent extends SwapFilterEvent {}

class SwapSelectCategoryItemEvent extends SwapFilterEvent {
  final int index;
  SwapSelectCategoryItemEvent({required this.index});
}

class GetSwapCitiesEvent extends SwapFilterEvent {}
