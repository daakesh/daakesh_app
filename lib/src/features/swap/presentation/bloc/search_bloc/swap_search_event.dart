import '../../../../../src.export.dart';

abstract class SwapSearchEvent {}

class SwapSearchOnItemsEvent extends SwapSearchEvent {
  final String? searchValue;
  final int page;
  final bool isSeeMore;
  SwapSearchOnItemsEvent(
      {this.searchValue, this.page = 1, this.isSeeMore = false});
}

class SwapEmptySearchEvent extends SwapSearchEvent {}

class SwapSearchFilterEvent extends SwapSearchEvent {
  final String? searchValue;
  final bool? isFilterActive;
  final bool isSeeMore;

  SwapSearchFilterEvent({
    this.searchValue,
    this.isFilterActive,
    this.isSeeMore = false,
  });
}

class SwapSetSearchFilterDataEvent extends SwapSearchEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SwapSetSearchFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class SwapClearSearchFilterDataEvent extends SwapSearchEvent {}
