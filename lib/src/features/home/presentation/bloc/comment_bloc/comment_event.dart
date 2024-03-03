abstract class CommentEvent {}

class AddCommentEvent extends CommentEvent{
  final int userId;
  final int itemId;
  final String commentDesc;

  AddCommentEvent({
    required this.userId,
    required this.itemId,
    required this.commentDesc,
  });
}

class GetCommentByItemEvent extends CommentEvent{
  final int itemId;

  GetCommentByItemEvent({
    required this.itemId,
  });
}

class RemoveCommentsEvent extends CommentEvent{
  final int id;
  RemoveCommentsEvent({
    required this.id,
  });
}

class EditCommentEvent extends CommentEvent{
  final int id;
  final String commentDesc;
  EditCommentEvent({
    required this.id,
    required this.commentDesc,
  });
}


