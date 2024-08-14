import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum MyProStateStatus { INITIAL, LOADING, SUCCESS, ERROR, LOADINGMORE, NULL }

extension MyProStateStatusX on MyProStateStatus {
  bool get isInitial => this == MyProStateStatus.INITIAL;
  bool get isSuccess => this == MyProStateStatus.SUCCESS;
  bool get isError => this == MyProStateStatus.ERROR;
  bool get isLoading => this == MyProStateStatus.LOADING;
  bool get isLoadingMore => this == MyProStateStatus.LOADINGMORE;
  bool get isNull => this == MyProStateStatus.NULL;
}

class MyProState extends Equatable {
  final MyProStateStatus myProStateStatus;
  final List<MyProductItem> myProductListData;
  final int currentPage;
  final bool isMoreData;
  final List<CommentRateModelItem> commentList;
  final int commentCount;
  final int commentCurrentPage;
  final bool isCommentsMoreData;
  final int itemId;
  final double rateAverage;

  const MyProState({
    this.myProStateStatus = MyProStateStatus.INITIAL,
    this.myProductListData = const [],
    this.currentPage = 1,
    this.isMoreData = true,
    this.commentList = const [],
    this.commentCount = 0,
    this.commentCurrentPage = 0,
    this.isCommentsMoreData = true,
    this.itemId = 0,
    this.rateAverage = 0.0,
  });

  MyProState copyWith({
    MyProStateStatus? myProStateStatus,
    List<MyProductItem>? myProductListData,
    int? currentPage,
    bool? isMoreData,
    List<CommentRateModelItem>? commentList,
    int? commentCount,
    int? commentCurrentPage,
    bool? isCommentsMoreData,
    int? itemId,
    double? rateAverage,
  }) {
    return MyProState(
      myProStateStatus: myProStateStatus ?? this.myProStateStatus,
      myProductListData: myProductListData ?? this.myProductListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
      commentList: commentList ?? this.commentList,
      commentCount: commentCount ?? this.commentCount,
      commentCurrentPage: commentCurrentPage ?? this.commentCurrentPage,
      isCommentsMoreData: isCommentsMoreData ?? this.isCommentsMoreData,
      itemId: itemId ?? this.itemId,
      rateAverage: rateAverage ?? this.rateAverage,
    );
  }

  @override
  List<Object?> get props => [
        myProStateStatus,
        myProductListData,
        currentPage,
        isMoreData,
        commentList,
        commentCount,
        commentCurrentPage,
        isCommentsMoreData,
        itemId,
        rateAverage,
      ];
}
