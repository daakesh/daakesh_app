import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_addToCart);
    on<GetCartItemsEvent>(_getCartItems);
    on<IncreaseItemCountEvent>(_increaseItemCount);
    on<DecreaseItemCountEvent>(_decreaseItemCount);
  }
  static CartBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _addToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStateStatus: CartStateStatus.LOADING));
    ProgressCircleDialog.show();
    final result = await getIt
        .get<HomeUseCases>()
        .addToCart(event.itemID, event.country, event.address);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(cartStateStatus: CartStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      emit(state.copyWith(cartStateStatus: CartStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getCartItems(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStateStatus: CartStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCartItemsByUser();
    result.fold((l) {
      emit(state.copyWith(cartStateStatus: CartStateStatus.ERROR));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }
      CartModel cartModel = CartModel.fromJson(r.data);
      List<CartItem> cartItemsList = cartModel.data!.cart!.toList();

      emit(state.copyWith(
        cartStateStatus: CartStateStatus.SUCCESS,
        cartItemsList: cartItemsList,
      ));
    });
  }

  FutureOr<void> _increaseItemCount(
      IncreaseItemCountEvent event, Emitter<CartState> emit) {
    List<CartItem> cartItemsList = state.cartItemsList.toList();
    cartItemsList[event.index].quantity =
        cartItemsList[event.index].quantity! + 1;
    emit(state.copyWith(cartItemsList: []));
    emit(state.copyWith(cartItemsList: cartItemsList.toList()));
  }

  FutureOr<void> _decreaseItemCount(
      DecreaseItemCountEvent event, Emitter<CartState> emit) {
    List<CartItem> cartItemsList = state.cartItemsList.toList();
    if (cartItemsList[event.index].quantity == 1) {
      cartItemsList.removeAt(event.index);
    } else {
      cartItemsList[event.index].quantity =
          cartItemsList[event.index].quantity! - 1;
    }
    emit(state.copyWith(cartItemsList: []));
    emit(state.copyWith(cartItemsList: cartItemsList));
  }
}
