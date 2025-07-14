import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_addToCart);
    on<GetCartItemsEvent>(_getCartItems);
    on<IncreaseItemCountEvent>(_increaseItemCount);
    on<DecreaseItemCountEvent>(_decreaseItemCount);
    on<AddOrderEvent>(_addOrder);
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
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      CartBloc.get.add(GetCartItemsEvent());
      emit(state.copyWith(cartStateStatus: CartStateStatus.SUCCESS));
    });
  }

  FutureOr<void> _getCartItems(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStateStatus: CartStateStatus.LOADING));
    final result = await getIt.get<HomeUseCases>().getCartItemsByUser();
    result.fold((l) {
      emit(state.copyWith(cartStateStatus: CartStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
        return;
      }
      CartModel cartModel = CartModel.fromJson(r.data);
      List<CartItem> cartItemsList = cartModel.data!.cart!.toList();
      double totalPrice = cartModel.data!.totalPrice.toDouble();

      emit(state.copyWith(
        cartStateStatus: CartStateStatus.SUCCESS,
        cartItemsList: cartItemsList,
        totalPrice: totalPrice,
      ));
    });
  }

  Timer? increaseTimer;

  FutureOr<void> _increaseItemCount(
      IncreaseItemCountEvent event, Emitter<CartState> emit) {
    increaseTimer?.cancel();
    List<CartItem> cartItemsList = state.cartItemsList.toList();
    cartItemsList[event.index].quantity =
        cartItemsList[event.index].quantity! + 1;

    increaseTimer = Timer(const Duration(milliseconds: 300), () async {
      CartItem cartItem = cartItemsList[event.index];
      await getIt.get<HomeUseCases>().updateCartItem(
            cartItem.id.toString(),
            ValueConstants.userId,
            cartItem.item!.id.toString(),
            cartItem.quantity.toString(),
          );
    });
    debugPrint(cartItemsList[event.index].item!.priceAfterDiscount.toString());
    double totalPrice = state.totalPrice +
        cartItemsList[event.index].item!.priceAfterDiscount.toDouble();

    emit(state.copyWith(cartItemsList: []));
    emit(state.copyWith(
        cartItemsList: cartItemsList.toList(), totalPrice: totalPrice));
  }

  Timer? decreaseTimer;
  FutureOr<void> _decreaseItemCount(
      DecreaseItemCountEvent event, Emitter<CartState> emit) async {
    List<CartItem> cartItemsList = state.cartItemsList.toList();
    double totalPrice;
    decreaseTimer?.cancel();

    if (cartItemsList[event.index].quantity == 1) {
      totalPrice = state.totalPrice -
          cartItemsList[event.index].item!.priceAfterDiscount.toDouble();
      getIt
          .get<HomeUseCases>()
          .removeCartItem(cartItemsList[event.index].id.toString());
      cartItemsList.removeAt(event.index);
    } else {
      cartItemsList[event.index].quantity =
          cartItemsList[event.index].quantity! - 1;
      decreaseTimer = Timer(const Duration(milliseconds: 300), () async {
        CartItem cartItem = cartItemsList[event.index];
        await getIt.get<HomeUseCases>().updateCartItem(
              cartItem.id.toString(),
              ValueConstants.userId,
              cartItem.item!.id.toString(),
              cartItem.quantity.toString(),
            );
      });
    }
    totalPrice = state.totalPrice -
        cartItemsList[event.index].item!.priceAfterDiscount.toDouble();
    emit(state.copyWith(cartItemsList: []));
    emit(state.copyWith(cartItemsList: cartItemsList, totalPrice: totalPrice));
  }

  FutureOr<void> _addOrder(AddOrderEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStateStatus: CartStateStatus.LOADING));
    ProgressCircleDialog.show();
    List<Map<String, dynamic>> ordersList = <Map<String, dynamic>>[];
    for (CartItem data in state.cartItemsList) {
      double price = data.item!.priceAfterDiscount * data.quantity;
      AddOrderModel addOrderModel = AddOrderModel();
      addOrderModel
        ..userId = ValueConstants.userId
        ..itemId = data.item!.id
        ..price = price
        ..location = 'Jordan , Amman , Abdon , 29'
        ..status = '1';
      ordersList.add(addOrderModel.toJson());
    }

    final result = await getIt.get<HomeUseCases>().addOrder(ordersList);
    result.fold((l) {
      ProgressCircleDialog.dismiss();
      emit(state.copyWith(cartStateStatus: CartStateStatus.ERROR));
      ShowToastSnackBar.showCustomDialog(message: l.message.toString());
    }, (r) async {
      ProgressCircleDialog.dismiss();
      if (!r.status!) {
        ShowToastSnackBar.showCustomDialog(message: r.message.toString());
      }

      ///SellOrderBloc.get.add(GetMyOrderEvent());
      Utils.openNewPage(const ConfirmOrderScreen());
      emit(state.copyWith(cartStateStatus: CartStateStatus.SUCCESS));
    });
  }
}
