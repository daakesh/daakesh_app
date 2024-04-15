import 'package:equatable/equatable.dart';
import '../../../../../src.export.dart';

enum CartStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension CartStateStatusX on CartStateStatus {
  bool get isInitial => this == CartStateStatus.INITIAL;
  bool get isSuccess => this == CartStateStatus.SUCCESS;
  bool get isError => this == CartStateStatus.ERROR;
  bool get isLoading => this == CartStateStatus.LOADING;
}

class CartState extends Equatable {
  final CartStateStatus cartStateStatus;
  final List<CartItem> cartItemsList;
  final String totalPrice;
  const CartState({
    this.cartStateStatus = CartStateStatus.INITIAL,
    this.cartItemsList = const [],
    this.totalPrice = '',
  });

  CartState copyWith({
    CartStateStatus? cartStateStatus,
    List<CartItem>? cartItemsList,
    String? totalPrice,
  }) {
    return CartState(
      cartStateStatus: cartStateStatus ?? this.cartStateStatus,
      cartItemsList: cartItemsList ?? this.cartItemsList,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [cartStateStatus, cartItemsList, totalPrice];
}
