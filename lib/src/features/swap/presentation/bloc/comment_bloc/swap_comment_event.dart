abstract class SwapCommentEvent {}

class SwapAddCommentEvent extends SwapCommentEvent{
  final int userId;
  final int itemId;
  final String commentDesc;

  SwapAddCommentEvent({
    required this.userId,
    required this.itemId,
    required this.commentDesc,
  });
}

class SwapGetCommentByItemEvent extends SwapCommentEvent{
  final int itemId;

  SwapGetCommentByItemEvent({
    required this.itemId,
  });
}

class SwapRemoveCommentsEvent extends SwapCommentEvent{
  final int id;
  SwapRemoveCommentsEvent({
    required this.id,
  });
}

class SwapEditCommentEvent extends SwapCommentEvent{
  final int id;
  final String commentDesc;
  SwapEditCommentEvent({
    required this.id,
    required this.commentDesc,
  });
}


