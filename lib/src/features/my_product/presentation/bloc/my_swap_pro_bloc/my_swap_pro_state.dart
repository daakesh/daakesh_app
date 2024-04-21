import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum MySwapProStateStatus { INITIAL, LOADING, SUCCESS, ERROR,LOADINGMORE,NULL }

extension MySwapProStateStatusX on MySwapProStateStatus {
  bool get isInitial => this == MySwapProStateStatus.INITIAL;
  bool get isSuccess => this == MySwapProStateStatus.SUCCESS;
  bool get isError => this == MySwapProStateStatus.ERROR;
  bool get isLoading => this == MySwapProStateStatus.LOADING;
  bool get isLoadingMore => this == MySwapProStateStatus.LOADINGMORE;
  bool get isNull => this == MySwapProStateStatus.NULL;
}

class MySwapProState extends Equatable {
  final MySwapProStateStatus mySwapProStateStatus;
  final List<MyProductItem> mySwapProductListData;
  final int currentPage;
  final bool isMoreData;

  const MySwapProState({
    this.mySwapProStateStatus = MySwapProStateStatus.INITIAL,
    this.mySwapProductListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  MySwapProState copyWith({
    MySwapProStateStatus? mySwapProStateStatus,
    List<MyProductItem>? myProductListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return MySwapProState(
      mySwapProStateStatus: mySwapProStateStatus ?? this.mySwapProStateStatus,
      mySwapProductListData: myProductListData ?? this.mySwapProductListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        mySwapProStateStatus,
        mySwapProductListData,
        currentPage,
        isMoreData,
      ];
}
