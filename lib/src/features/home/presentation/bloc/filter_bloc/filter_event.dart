import '../../../../../src.export.dart';

abstract class FilterEvent {}

class PreviewSectionSubCategoriesEvent extends FilterEvent {
  final int? catID;
  final bool? isFilterActive;
  final bool isSeeMore;
  final SortingType? sortingType;

  PreviewSectionSubCategoriesEvent({
    this.catID,
    this.isFilterActive,
    this.isSeeMore = false,
    this.sortingType,
  });
}

class SetFilterDataEvent extends FilterEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class ClearFilterDataEvent extends FilterEvent {}

class SelectCategoryItemEvent extends FilterEvent {
  final int index;
  SelectCategoryItemEvent({required this.index});
}

class GetCitiesEvent extends FilterEvent {}
