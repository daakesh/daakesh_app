import '../../../../../src.export.dart';

abstract class OfferDealsEvent {}

class GetOfferDealsDataEvent extends OfferDealsEvent {
  final bool isSeeMore;
  GetOfferDealsDataEvent({this.isSeeMore = false});
}

class ViewAllOfferDealsItemsEvent extends OfferDealsEvent {
  final bool? isFilterActive;
  final bool isSeeMore;
  final SortingType? sortingType;
  ViewAllOfferDealsItemsEvent({
    this.isSeeMore = false,
    this.isFilterActive,
    this.sortingType,
  });
}

class GetAllOfferDealsEvent extends OfferDealsEvent {}

class ResetViewAllOfferDealsEvent extends OfferDealsEvent {}

class SetViewAllOfferDealsFilterEvent extends OfferDealsEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetViewAllOfferDealsFilterEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class GetViewAllOfferDealsCitiesEvent extends OfferDealsEvent {}
