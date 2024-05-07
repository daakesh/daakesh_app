abstract class HandmadeEvent {}

class GetHandmadeDataEvent extends HandmadeEvent {
  final bool isSeeMore;
  GetHandmadeDataEvent({this.isSeeMore = false});
}

class GetItemsByHomemadeEvent extends HandmadeEvent {
  final int? homemadeID;
  final bool isSeeMore;
  GetItemsByHomemadeEvent({this.homemadeID, this.isSeeMore = false});
}

class ResetHandmadeValueEvent extends HandmadeEvent {}
