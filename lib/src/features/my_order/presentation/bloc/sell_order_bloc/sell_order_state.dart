import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum SellOrderStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension SellOrderStateStatusX on SellOrderStateStatus{
  bool get isInitial => this == SellOrderStateStatus.INITIAL;
  bool get isSuccess => this == SellOrderStateStatus.SUCCESS;
  bool get isError => this == SellOrderStateStatus.ERROR;
  bool get isLoading => this == SellOrderStateStatus.LOADING;
}
class SellOrderState extends Equatable {
  final SellOrderStateStatus sellOrderStateStatus;
  final List<MyOrderData> myOrderDataList;


  const SellOrderState({
    this.sellOrderStateStatus = SellOrderStateStatus.INITIAL,
    this.myOrderDataList=const[],
  });

  SellOrderState copyWith({
     SellOrderStateStatus? sellOrderStateStatus,
     List<MyOrderData>? myOrderDataList,

  }) {
    return SellOrderState(
      sellOrderStateStatus: sellOrderStateStatus ?? this.sellOrderStateStatus,
      myOrderDataList: myOrderDataList ?? this.myOrderDataList,
    );
  }
  @override
  List<Object?> get props => [
    sellOrderStateStatus,
    myOrderDataList,
  ];
}
