import '../../../../../src.export.dart';

abstract class SearchEvent {}

class SearchOnItemsEvent extends SearchEvent {
  final String? searchValue;
  final int page;
  final bool isSeeMore;
  SearchOnItemsEvent({this.searchValue, this.page = 1, this.isSeeMore = false});
}

class SearchFilterEvent extends SearchEvent {
  final String? searchValue;
  final bool? isFilterActive;
  final bool isSeeMore;

  SearchFilterEvent({
    this.searchValue,
    this.isFilterActive,
    this.isSeeMore = false,
  });
}

class EmptySearchEvent extends SearchEvent {}

class SetSearchFilterDataEvent extends SearchEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetSearchFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class ClearSearchFilterDataEvent extends SearchEvent {}
