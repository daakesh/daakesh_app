import 'package:equatable/equatable.dart';

import '../../../../src.export.dart';

enum MyProductStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension MyProductStateStatusX on MyProductStateStatus{
  bool get isInitial => this == MyProductStateStatus.INITIAL;
  bool get isSuccess => this == MyProductStateStatus.SUCCESS;
  bool get isError => this == MyProductStateStatus.ERROR;
  bool get isLoading => this == MyProductStateStatus.LOADING;
}

class MyProductState extends Equatable {
  final MyProductStateStatus myProductStateStatus;
  final ProductTapBar productTapBar;




  const MyProductState({
    this.myProductStateStatus = MyProductStateStatus.INITIAL,
    this.productTapBar = ProductTapBar.SHOP,

  });

  MyProductState copyWith({
    MyProductStateStatus? myProductStateStatus,
    ProductTapBar? productTapBar,



  }) {
    return MyProductState(
      myProductStateStatus: myProductStateStatus ?? this.myProductStateStatus,
      productTapBar: productTapBar ?? this.productTapBar,


    );
  }

  @override
  List<Object?> get props => [
        myProductStateStatus,
        productTapBar,
      ];
}
