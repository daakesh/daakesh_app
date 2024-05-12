abstract class CommentEvent {}

class AddCommentEvent extends CommentEvent {
  final String userId;
  final int itemId;
  final String commentDesc;
  final int catID;
  final int subID;
  final double rateValue;

  AddCommentEvent({
    required this.userId,
    required this.itemId,
    required this.commentDesc,
    required this.catID,
    required this.subID,
    required this.rateValue,
  });
}

class GetCommentByItemEvent extends CommentEvent {
  final int? itemId;
  final bool isSeeMore;

  GetCommentByItemEvent({
    this.itemId,
    this.isSeeMore = false,
  });
}

class RemoveCommentsEvent extends CommentEvent {
  final int id;
  RemoveCommentsEvent({
    required this.id,
  });
}

class GetCommentCountEvent extends CommentEvent {
  final int itemId;
  GetCommentCountEvent({
    required this.itemId,
  });
}

class EmptyCommentDataEvent extends CommentEvent {}
