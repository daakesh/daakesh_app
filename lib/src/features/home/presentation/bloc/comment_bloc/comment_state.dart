import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum CommentStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension CommentStateStatusX on CommentStateStatus {
  bool get isInitial => this == CommentStateStatus.INITIAL;
  bool get isSuccess => this == CommentStateStatus.SUCCESS;
  bool get isError => this == CommentStateStatus.ERROR;
  bool get isLoading => this == CommentStateStatus.LOADING;
  bool get isLoadingMore => this == CommentStateStatus.LOADINGMORE;
  bool get isNull => this == CommentStateStatus.NULL;
}

class CommentState extends Equatable {
  final CommentStateStatus commentStateStatus;
  final List<CommentRateModelItem> commentList;
  final int currentPage;
  final bool isMoreData;
  final int itemId;
  final int commentCount;
  final double avgRate;
  final int rateCount;

  const CommentState({
    this.commentStateStatus = CommentStateStatus.INITIAL,
    this.commentList = const [],
    this.currentPage = 1,
    this.isMoreData = true,
    this.itemId = 0,
    this.commentCount = 0,
    this.avgRate = 0,
    this.rateCount = 0,
  });

  CommentState copyWith({
    CommentStateStatus? commentStateStatus,
    List<CommentRateModelItem>? commentList,
    int? currentPage,
    bool? isMoreData,
    int? itemId,
    int? commentCount,
    double? avgRate,
    int? rateCount,
  }) {
    return CommentState(
      commentStateStatus: commentStateStatus ?? this.commentStateStatus,
      commentList: commentList ?? this.commentList,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      itemId: itemId ?? this.itemId,
      commentCount: commentCount ?? this.commentCount,
      avgRate: avgRate ?? this.avgRate,
      rateCount: rateCount ?? this.rateCount,
    );
  }

  @override
  List<Object?> get props => [
        commentStateStatus,
        commentList,
        currentPage,
        isMoreData,
        itemId,
        commentCount,
        avgRate,
        rateCount
      ];
}
