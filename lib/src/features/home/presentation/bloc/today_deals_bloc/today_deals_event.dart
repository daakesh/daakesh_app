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
  final SortingType? sortingType;
  GetViewAllItemsEvent({
    this.isSeeMore = false,
    this.isFilterActive,
    this.sortingType,
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

class UpdateTodayDealsItem extends TodayDealsEvent {
  final int id;
  final double avgRating;
  final int rateCount;

  UpdateTodayDealsItem(
      {required this.rateCount, required this.id, required this.avgRating});
}

class UpdateTodayDealsItemFavoriteEvent extends TodayDealsEvent {
  final int id;
  final bool isFavorite;

  UpdateTodayDealsItemFavoriteEvent({
    required this.id,
    required this.isFavorite,
  });
}
