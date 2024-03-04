abstract class RateEvent {}

class AddRateEvent extends RateEvent{
  final int userId;
  final int itemId;
  final int catID;
  final int rateValue;

  AddRateEvent({
    required this.userId,
    required this.itemId,
    required this.catID,
    required this.rateValue,
  });
}

class GetRateByItemEvent extends RateEvent{
  final int itemId;
  final int userId;

  GetRateByItemEvent({
    required this.itemId,
    required this.userId,
  });
}

class EditRateEvent extends RateEvent{
  final int id;
  final int rateValue;
  EditRateEvent({
    required this.id,
    required this.rateValue,
  });
}


