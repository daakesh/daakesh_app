import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum MyProStateStatus { INITIAL, LOADING, SUCCESS, ERROR,LOADINGMORE,NULL }

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

  const MyProState({
    this.myProStateStatus = MyProStateStatus.INITIAL,
    this.myProductListData = const[],
    this.currentPage = 1,
    this.isMoreData = true,
  });

  MyProState copyWith({
    MyProStateStatus? myProStateStatus,
    List<MyProductItem>? myProductListData,
    int? currentPage,
    bool? isMoreData,
  }) {
    return MyProState(
      myProStateStatus: myProStateStatus ?? this.myProStateStatus,
      myProductListData: myProductListData ?? this.myProductListData,
      currentPage: currentPage ?? this.currentPage,
      isMoreData: isMoreData ?? this.isMoreData,
    );
  }

  @override
  List<Object?> get props => [
        myProStateStatus,
        myProductListData,
        currentPage,
        isMoreData,
      ];
}
