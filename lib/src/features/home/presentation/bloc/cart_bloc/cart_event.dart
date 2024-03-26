abstract class CartEvent{}

class AddToCartEvent extends CartEvent{
  final String itemID;
  AddToCartEvent({required this.itemID});
}

class GetCartItemsEvent extends CartEvent{}

class IncreaseItemCountEvent extends CartEvent{
  final int index;
  IncreaseItemCountEvent({required this.index});
}
class DecreaseItemCountEvent extends CartEvent{
  final int index;
  DecreaseItemCountEvent({required this.index});
}
