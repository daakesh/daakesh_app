
abstract class BrandsEvent {}


class GetBrandsDataEvent extends BrandsEvent{
  final bool isSeeMore;
  GetBrandsDataEvent({this.isSeeMore= false});
}
