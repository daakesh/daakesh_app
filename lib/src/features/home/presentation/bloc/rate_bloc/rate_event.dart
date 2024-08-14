abstract class RateEvent {}

class AddRateEvent extends RateEvent {
  final String userId;
  final int itemId;
  final int catID;
  final double rateValue;

  AddRateEvent({
    required this.userId,
    required this.itemId,
    required this.catID,
    required this.rateValue,
  });
}

class GetRateByItemEvent extends RateEvent {
  final int itemId;
  final int userId;

  GetRateByItemEvent({
    required this.itemId,
    required this.userId,
  });
}

class EditRateEvent extends RateEvent {
  final int id;
  final int rateValue;
  EditRateEvent({
    required this.id,
    required this.rateValue,
  });
}

class GetOverAllRateItemsEvent extends RateEvent {
  final int itemID;
  GetOverAllRateItemsEvent({
    required this.itemID,
  });
}

class EmptyDataEvent extends RateEvent {}
