import 'package:equatable/equatable.dart';

enum ShippingStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension ShippingStateStatusX on ShippingStateStatus{
  bool get isInitial => this == ShippingStateStatus.INITIAL;
  bool get isSuccess => this == ShippingStateStatus.SUCCESS;
  bool get isError => this == ShippingStateStatus.ERROR;
  bool get isLoading => this == ShippingStateStatus.LOADING;
}

class ShippingState extends Equatable {
  final ShippingStateStatus shippingStateStatus;
  final String shippingFlag;
  final String phoneNumberFlag;
  final String phoneNumberCode;


  const ShippingState({
    this.shippingStateStatus = ShippingStateStatus.INITIAL,
    this.shippingFlag = '',
    this.phoneNumberFlag = '',
    this.phoneNumberCode = '',
  });

  ShippingState copyWith({
     ShippingStateStatus? shippingStateStatus,
     String? shippingFlag,
     String? phoneNumberFlag,
     String? phoneNumberCode,

  }) {
    return ShippingState(
      shippingStateStatus: shippingStateStatus ?? this.shippingStateStatus,
      shippingFlag: shippingFlag ?? this.shippingFlag,
      phoneNumberFlag: phoneNumberFlag ?? this.phoneNumberFlag,
      phoneNumberCode: phoneNumberCode ?? this.phoneNumberCode,
    );
  }

  @override
  List<Object?> get props => [
    shippingStateStatus,
    shippingFlag,
    phoneNumberCode,
  ];
}
