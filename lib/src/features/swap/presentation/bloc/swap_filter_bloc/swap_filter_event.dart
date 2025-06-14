import '../../../../../src.export.dart';

abstract class SwapFilterEvent {}

class SwapPreviewSectionSubCategoriesEvent extends SwapFilterEvent {
  final int? catID;
  final bool? isFilterActive;
  final bool isSeeMore;
  final SortingType? sortingType;
  final bool? isAllItems;

  SwapPreviewSectionSubCategoriesEvent({
    this.catID,
    this.isFilterActive,
    this.isSeeMore = false,
    this.sortingType,
    this.isAllItems,
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

class GetSwapSubCategoriesEvent extends SwapFilterEvent {
  final int catID;

  GetSwapSubCategoriesEvent({required this.catID});
}
