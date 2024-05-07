abstract class BrandsEvent {}

class GetBrandsDataEvent extends BrandsEvent {
  final bool isSeeMore;
  GetBrandsDataEvent({this.isSeeMore = false});
}

class GetItemsByBrandsEvent extends BrandsEvent {
  final int? brandID;
  final bool isSeeMore;
  GetItemsByBrandsEvent({
    this.brandID,
    this.isSeeMore = false,
  });
}

class ResetValueEvent extends BrandsEvent {}
