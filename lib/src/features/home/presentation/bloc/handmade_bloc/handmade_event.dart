
abstract class HandmadeEvent {}


class GetHandmadeDataEvent extends HandmadeEvent{
  final bool isSeeMore;
  GetHandmadeDataEvent({this.isSeeMore= false});
}
