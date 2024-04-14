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
  const CartState({
    this.cartStateStatus = CartStateStatus.INITIAL,
    this.cartItemsList = const [],
  });

  CartState copyWith({
    CartStateStatus? cartStateStatus,
    List<CartItem>? cartItemsList,
    int? counter,
  }) {
    return CartState(
      cartStateStatus: cartStateStatus ?? this.cartStateStatus,
      cartItemsList: cartItemsList ?? this.cartItemsList,
    );
  }

  @override
  List<Object?> get props => [
        cartStateStatus,
        cartItemsList,
      ];
}
