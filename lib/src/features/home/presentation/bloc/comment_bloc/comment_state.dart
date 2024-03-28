// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum CommentStateStatus { INITIAL, LOADING, SUCCESS, ERROR ,LOADINGMORE,NULL}

extension CommentStateStatusX on CommentStateStatus{
  bool get isInitial => this == CommentStateStatus.INITIAL;
  bool get isSuccess => this == CommentStateStatus.SUCCESS;
  bool get isError => this == CommentStateStatus.ERROR;
  bool get isLoading => this == CommentStateStatus.LOADING;
  bool get isLoadingMore => this == CommentStateStatus.LOADINGMORE;
  bool get isNull => this == CommentStateStatus.NULL;
}

class CommentState extends Equatable {
  final CommentStateStatus commentStateStatus;


  const CommentState({
    this.commentStateStatus = CommentStateStatus.INITIAL,

  });

  CommentState copyWith({
    CommentStateStatus? commentStateStatus,

  }) {
    return CommentState(
      commentStateStatus: commentStateStatus ?? this.commentStateStatus,


    );
  }

  @override
  List<Object?> get props => [
    commentStateStatus,
  ];
}


