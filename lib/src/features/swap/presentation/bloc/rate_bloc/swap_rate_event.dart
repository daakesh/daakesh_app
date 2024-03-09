abstract class SwapRateEvent {}

class SwapAddRateEvent extends SwapRateEvent{
  final int userId;
  final int itemId;
  final int catID;
  final int rateValue;

  SwapAddRateEvent({
    required this.userId,
    required this.itemId,
    required this.catID,
    required this.rateValue,
  });
}

class SwapGetRateByItemEvent extends SwapRateEvent{
  final int itemId;
  final int userId;

  SwapGetRateByItemEvent({
    required this.itemId,
    required this.userId,
  });
}

class SwapEditRateEvent extends SwapRateEvent{
  final int id;
  final int rateValue;
  SwapEditRateEvent({
    required this.id,
    required this.rateValue,
  });
}


