import 'package:daakesh/src/core/enum/enum.dart';

abstract class FavouriteEvent {}

class GetFavouriteDataEvent extends FavouriteEvent {
  final bool isFromProdScreen;
  final bool isFavouriteFromProd;
  final int itemID;

  GetFavouriteDataEvent({
    this.isFromProdScreen = false,
    this.isFavouriteFromProd = false,
    this.itemID = 0,
  });
}

class AddFavouriteEvent extends FavouriteEvent {
  final int itemId;

  AddFavouriteEvent({
    required this.itemId,
  });
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final int itemId;

  RemoveFavouriteEvent({required this.itemId});
}

class SetFavouriteEvent extends FavouriteEvent {
  final bool isFavourite;

  SetFavouriteEvent({
    required this.isFavourite,
  });
}

class SetTabFavIndexEvent extends FavouriteEvent {
  final int index;

  SetTabFavIndexEvent({
    required this.index,
  });
}

class SwapTabBarFavouriteTypeEvent extends FavouriteEvent {
  final FavouriteTapBarENUM favouriteTapBarENUM;

  SwapTabBarFavouriteTypeEvent({
    required this.favouriteTapBarENUM,
  });
}

class SearchFavouriteItemsEvent extends FavouriteEvent {
  final String searchQuery;

  SearchFavouriteItemsEvent(this.searchQuery);
}
