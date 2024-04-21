import '../../../../../src.export.dart';

abstract class FilterEvent {}

class PreviewSectionSubCategoriesEvent extends FilterEvent {
  final int? catID;
  final bool? isFilterActive;
  final bool isSeeMore;

  PreviewSectionSubCategoriesEvent({
    this.catID,
    this.isFilterActive,
    this.isSeeMore = false,
  });
}

class SetFilterDataEvent extends FilterEvent {
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetFilterDataEvent({
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class ClearFilterDataEvent extends FilterEvent {}
