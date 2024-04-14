abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final String itemID;
  final String country;
  final String address;
  AddToCartEvent({
    required this.itemID,
    required this.country,
    required this.address,
  });
}

class GetCartItemsEvent extends CartEvent {}

class IncreaseItemCountEvent extends CartEvent {
  final int index;
  IncreaseItemCountEvent({required this.index});
}

class DecreaseItemCountEvent extends CartEvent {
  final int index;
  DecreaseItemCountEvent({required this.index});
}
