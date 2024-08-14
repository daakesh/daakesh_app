import '../../../../../src.export.dart';

abstract class BrandsEvent {}

class GetBrandsDataEvent extends BrandsEvent {
  final bool isSeeMore;
  GetBrandsDataEvent({
    this.isSeeMore = false,
  });
}

class GetItemsByBrandsEvent extends BrandsEvent {
  final int? brandID;
  final bool? isFilterActive;
  final bool isSeeMore;
  final SortingType? sortingType;
  GetItemsByBrandsEvent({
    this.isSeeMore = false,
    this.brandID,
    this.isFilterActive,
    this.sortingType,
  });
}

class ResetValueEvent extends BrandsEvent {}

class SetBrandFilterData extends BrandsEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetBrandFilterData({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class GetBrandsCitiesEvent extends BrandsEvent {}
