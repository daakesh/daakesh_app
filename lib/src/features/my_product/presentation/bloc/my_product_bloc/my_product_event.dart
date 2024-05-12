abstract class MyProEvent {}

class GetMyProductEvent extends MyProEvent {
  final bool isSeeMore;
  GetMyProductEvent({this.isSeeMore = false});
}

class AddProCommentEvent extends MyProEvent {
  final String userId;
  final int itemId;
  final String commentDesc;
  final int catID;
  final int subID;
  final double rateValue;

  AddProCommentEvent({
    required this.userId,
    required this.itemId,
    required this.commentDesc,
    required this.catID,
    required this.subID,
    required this.rateValue,
  });
}

class GetProCommentCountEvent extends MyProEvent {
  final int itemId;
  GetProCommentCountEvent({
    required this.itemId,
  });
}

class GetProCommentByItemEvent extends MyProEvent {
  final int? itemId;
  final bool isSeeMore;

  GetProCommentByItemEvent({
    this.itemId,
    this.isSeeMore = false,
  });
}

class GetProOverAllRateItemsEvent extends MyProEvent {
  final int itemID;
  GetProOverAllRateItemsEvent({
    required this.itemID,
  });
}

class EmptyProDataEvent extends MyProEvent {}
