import 'package:daakesh/src/core/core.export.dart';

abstract class TrendDealsEvent {}

class GetTrendDealsDataEvent extends TrendDealsEvent {
  final bool isSeeMore;
  GetTrendDealsDataEvent({this.isSeeMore = false});
}

class GetItemsViewAllsEvent extends TrendDealsEvent {
  final bool? isFilterActive;
  final bool isSeeMore;
  final SortingType? sortingType;
  GetItemsViewAllsEvent({
    this.isSeeMore = false,
    this.isFilterActive,
    this.sortingType,
  });
}

class ResetViewAllValueEvent extends TrendDealsEvent {}

class SetViewAllFilterDataEvent extends TrendDealsEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetViewAllFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class GetViewAllsCitiesEvent extends TrendDealsEvent {}

class UpdateTrendDealsItemFavoriteEvent extends TrendDealsEvent {
  final int id;
  final bool isFavorite;

  UpdateTrendDealsItemFavoriteEvent({
    required this.id,
    required this.isFavorite,
  });
}
