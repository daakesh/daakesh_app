import '../../../../../src.export.dart';

abstract class TodayDealsEvent {}

class GetToadyDaakeshDealsDataEvent extends TodayDealsEvent {
  final bool isSeeMore;
  GetToadyDaakeshDealsDataEvent({this.isSeeMore = false});
}

class GetToadyDealsDataEvent extends TodayDealsEvent {
  final bool isSeeMore;
  GetToadyDealsDataEvent({this.isSeeMore = false});
}

class GetViewAllItemsEvent extends TodayDealsEvent {
  final bool? isFilterActive;
  final bool isSeeMore;
  GetViewAllItemsEvent({
    this.isSeeMore = false,
    this.isFilterActive,
  });
}

class ResetViewAllEvent extends TodayDealsEvent {}

class SetViewAllFilterEvent extends TodayDealsEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetViewAllFilterEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class GetViewAllCitiesEvent extends TodayDealsEvent {}
