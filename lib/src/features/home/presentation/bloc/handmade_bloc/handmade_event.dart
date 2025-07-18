import '../../../../../src.export.dart';

abstract class HandmadeEvent {}

class GetHandmadeDataEvent extends HandmadeEvent {
  final bool isSeeMore;
  final bool? isFilterActive;
  final SortingType? sortingType;

  GetHandmadeDataEvent(
      {this.isFilterActive, this.isSeeMore = false, this.sortingType});
}

class GetItemsByHomemadeEvent extends HandmadeEvent {
  final int? homemadeID;
  final bool isSeeMore;
  GetItemsByHomemadeEvent({this.homemadeID, this.isSeeMore = false});
}

class ResetHandmadeValueEvent extends HandmadeEvent {}

class SetHandmadeFilterDataEvent extends HandmadeEvent {
  final String? city;
  final int? rate;
  final double? fromPrice;
  final double? toPrice;
  final FilterProductType? productType;

  SetHandmadeFilterDataEvent({
    this.city,
    this.rate,
    this.fromPrice,
    this.toPrice,
    this.productType,
  });
}

class ClearHandmadeFilterDataEvent extends HandmadeEvent {}

class GetHandmadeCitiesEvent extends HandmadeEvent {}

class UpdateHandMadeItemEvent extends HandmadeEvent {
  final int id;
  final double avgRating;
  final int rateCount;

  UpdateHandMadeItemEvent(
      {required this.rateCount, required this.id, required this.avgRating});
}
