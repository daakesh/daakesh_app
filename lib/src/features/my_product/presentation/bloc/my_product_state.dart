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
  final ProductDisplayMethod productDisplayMethod;
  final String swapFlagEmoji;




  const MyProductState({
    this.myProductStateStatus = MyProductStateStatus.INITIAL,
    this.productTapBar = ProductTapBar.SHOP,
    this.productDisplayMethod = ProductDisplayMethod.SALE,
    this.swapFlagEmoji = '🇯🇴',

  });

  MyProductState copyWith({
    MyProductStateStatus? myProductStateStatus,
    ProductTapBar? productTapBar,
    ProductDisplayMethod? productDisplayMethod,
    String? swapFlagEmoji,


  }) {
    return MyProductState(
      myProductStateStatus: myProductStateStatus ?? this.myProductStateStatus,
      productTapBar: productTapBar ?? this.productTapBar,
      productDisplayMethod: productDisplayMethod ?? this.productDisplayMethod,
      swapFlagEmoji: swapFlagEmoji ?? this.swapFlagEmoji,


    );
  }

  @override
  List<Object?> get props => [
        myProductStateStatus,
        productTapBar,
        productDisplayMethod,
        swapFlagEmoji,
      ];
}
