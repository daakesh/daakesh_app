// import 'dart:async';
// import 'package:daakesh/src/features/favourite/data/moldels/favourite_response.dart';
// import 'package:daakesh/src/features/favourite/domin/usecases/use_cases.export.dart';
// import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_event.dart';
// import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../src.export.dart';

// class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
//   FavouriteBloc({
//     bool isFromProdScreen = false,
//     bool isFavouriteFromProd = false,
//     int itemID = 0,
//   }) : super(FavouriteInitialState()) {
//     on<GetFavouriteDataEvent>(_getFavouriteData);
//     on<RemoveFavouriteEvent>(_removeFavouriteItem);
//     on<SetFavouriteEvent>(_onSetItemFavourite);
//     on<AddFavouriteEvent>(_addFavouriteItem);

//     on<SwapTabBarFavouriteTypeEvent>(_onSwapTab);

//     add(GetFavouriteDataEvent(
//       isFavouriteFromProd: isFavouriteFromProd,
//       isFromProdScreen: isFromProdScreen,
//       itemID: itemID,
//     ));
//   }
//   FavouriteTapBarENUM currentTab = FavouriteTapBarENUM.SELL;

//   int favouriteItemId = 0;
//   bool isFavouriteItem = false;
//   //int currentTabIndex = 0;

//   List<FavouriteResponseModelData> favouriteItems = [];

//   void _onSwapTab(
//       SwapTabBarFavouriteTypeEvent event, Emitter<FavouriteState> emit) {
//     currentTab = event.favouriteTapBarENUM;

//     print('currentTab   $currentTab');
//     emit(FavouriteTabBarChangedState());
//     add(GetFavouriteDataEvent());
//   }

//   FutureOr<void> _onSetItemFavourite(
//       SetFavouriteEvent event, Emitter<FavouriteState> emit) {
//     isFavouriteItem = !isFavouriteItem;
//     print('isFavouriteItem: $isFavouriteItem');

//     emit(FavouriteItemChangeState());
//   }

//   FutureOr<void> _getFavouriteData(
//       GetFavouriteDataEvent event, Emitter<FavouriteState> emit) async {
//     emit(FavouriteLoadingState());

//     final result = await getIt.get<FavouriteUseCases>().getFavouriteByID();

//     result.fold((l) {
//       emit(FavouriteErrorState(message: l.message.toString()));
//       ShowToastSnackBar.showSnackBars(message: l.message.toString());
//     }, (r) async {
//       if (!r.status!) {
//         ShowToastSnackBar.showSnackBars(message: r.message.toString());
//         return;
//       }

//       FavouriteResponseModel favouriteResponseModel =
//           FavouriteResponseModel.fromJson(r.data);

//       // ✅ Filter based on currentTab (SELL / SWAP)
//       favouriteItems = favouriteResponseModel.data!.where((value) {
//         final type = value.item?.Type?.toLowerCase();
//         return currentTab == FavouriteTapBarENUM.SELL
//             ? type == 'sell'
//             : type == 'swap';
//       }).toList();

//       print('Filtered favouriteItems: $favouriteItems');

//       // ✅ Handle from product screen
//       if (event.isFromProdScreen && favouriteItems.isNotEmpty) {
//         if (event.isFavouriteFromProd) {
//           isFavouriteItem = true;
//         }

//         final matchedItem = favouriteItems.firstWhere(
//           (value) => value.item?.id == event.itemID,
//           orElse: () => FavouriteResponseModelData(),
//         );

//         favouriteItemId = matchedItem.id ?? 0;
//         print('Matched favouriteItemId: $favouriteItemId');
//       }

//       emit(FavouriteLoadedState());
//     });
//   }

// //   FutureOr<void> _getFavouriteData(
// //       GetFavouriteDataEvent event, Emitter<FavouriteState> emit) async {
// //     emit(FavouriteLoadingState());

// //     final result = await getIt.get<FavouriteUseCases>().getFavouriteByID();

// //     result.fold((l) {
// //       emit(FavouriteErrorState(message: l.message.toString()));
// //       ShowToastSnackBar.showSnackBars(message: l.message.toString());
// //     }, (r) async {
// //       if (!r.status!) {
// //         ShowToastSnackBar.showSnackBars(message: r.message.toString());
// //         return;
// //       }

// //       FavouriteResponseModel favouriteResponseModel =
// //           FavouriteResponseModel.fromJson(r.data);

// //       if (currentTabIndex == 0) {
// //         favouriteItems = favouriteResponseModel.data!
// //             .where((value) => value.item?.Type == "Sell")
// //             .toList();
// //       } else {
// //         favouriteItems = favouriteResponseModel.data!
// //             .where((value) => value.item?.Type == "Swap")
// //             .toList();
// //       }

// // //!!
// //       print('favouriteItems    $favouriteItems');

// //       // After loading, check condition
// //       if (event.isFromProdScreen && favouriteItems.isNotEmpty) {
// //         if (event.isFavouriteFromProd) {
// //           isFavouriteItem = true;
// //         }

// //         final matchedItem = favouriteItems.firstWhere(
// //           (value) => value.item?.id == event.itemID,
// //           orElse: () => FavouriteResponseModelData(),
// //         );

// //         favouriteItemId = matchedItem.id ?? 0;
// //       }

// //       print('favouriteItemId $favouriteItemId');
// //     });

// //     emit(FavouriteLoadedState());
// //   }

//   FutureOr<void> _removeFavouriteItem(
//       RemoveFavouriteEvent event, Emitter<FavouriteState> emit) async {
//     final result =
//         await getIt.get<FavouriteUseCases>().removeFavouriteItem(event.itemId);

//     result.fold((l) {
//       emit(FavouriteErrorState(message: l.message.toString()));
//       // ShowToastSnackBar.showSnackBars(message: l.message.toString());
//     }, (r) {
//       if (!r.status!) {
//         ShowToastSnackBar.showSnackBars(message: r.message.toString());
//         return;
//       }

//       favouriteItems.where((item) => item.id != event.itemId).toList();

//       ShowToastSnackBar.showSnackBars(message: r.message ?? "Item Deleted");
//     });
//   }

//   FutureOr<void> _addFavouriteItem(
//       AddFavouriteEvent event, Emitter<FavouriteState> emit) async {
//     final result = await getIt
//         .get<FavouriteUseCases>()
//         .addFavouriteItem(ValueConstants.userId, event.itemId);

//     result.fold((l) {
//       emit(FavouriteErrorState(message: l.message.toString()));
//       // ShowToastSnackBar.showSnackBars(message: l.message.toString());
//     }, (r) {
//       if (!r.status!) {
//         ShowToastSnackBar.showSnackBars(message: r.message.toString());
//         return;
//       }

//       ShowToastSnackBar.showSnackBars(message: r.message ?? "Item Added");
//     });
//   }
// }

import 'dart:async';

import 'package:daakesh/src/features/favourite/data/moldels/favourite_response.dart';
import 'package:daakesh/src/features/favourite/domin/usecases/use_cases.export.dart';
import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_event.dart';
import 'package:daakesh/src/features/favourite/presentation/bloc/favourite_bloc/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src.export.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc({
    bool isFromProdScreen = false,
    bool isFavouriteFromProd = false,
    int itemID = 0,
  }) : super(FavouriteInitialState()) {
    on<GetFavouriteDataEvent>(_getFavouriteData);
    on<RemoveFavouriteEvent>(_removeFavouriteItem);
    on<SetFavouriteEvent>(_onSetItemFavourite);
    on<AddFavouriteEvent>(_addFavouriteItem);
    on<SwapTabBarFavouriteTypeEvent>(_onSwapTab);
    on<SearchFavouriteItemsEvent>(_searchFavouriteItems);

    add(GetFavouriteDataEvent(
      isFavouriteFromProd: isFavouriteFromProd,
      isFromProdScreen: isFromProdScreen,
      itemID: itemID,
    ));
  }

  FavouriteTapBarENUM currentTab = FavouriteTapBarENUM.SELL;

  int favouriteItemId = 0;
  bool isFavouriteItem = false;
  List<FavouriteResponseModelData> favouriteItems = [];
  List<FavouriteResponseModelData> filteredFavouriteItems = [];

  List<FavouriteResponseModelData> _allFavouriteItems =
      []; // full original list

  void _onSwapTab(
      SwapTabBarFavouriteTypeEvent event, Emitter<FavouriteState> emit) {
    currentTab = event.favouriteTapBarENUM;
    emit(FavouriteTabBarChangedState());
    add(GetFavouriteDataEvent());
  }

  FutureOr<void> _onSetItemFavourite(
      SetFavouriteEvent event, Emitter<FavouriteState> emit) {
    isFavouriteItem = !isFavouriteItem;
    emit(FavouriteItemChangeState());
  }

  FutureOr<void> _getFavouriteData(
      GetFavouriteDataEvent event, Emitter<FavouriteState> emit) async {
    emit(FavouriteLoadingState());

    final result = await getIt.get<FavouriteUseCases>().getFavouriteByID();

    result.fold((l) {
      emit(FavouriteErrorState(message: l.message.toString()));
      ShowToastSnackBar.showSnackBars(message: l.message.toString());
    }, (r) async {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(message: r.message.toString());
        return;
      }

      FavouriteResponseModel favouriteResponseModel =
          FavouriteResponseModel.fromJson(r.data);

      // Save full list
      _allFavouriteItems = favouriteResponseModel.data ?? [];

      // Deduplicate by item id
      final seen = <int>{};
      _allFavouriteItems = _allFavouriteItems.where((fav) {
        final id = fav.item?.id;
        if (id == null) return false;
        if (seen.contains(id)) return false;
        seen.add(id);
        return true;
      }).toList();

      // Filter based on currentTab (SELL or SWAP)
      favouriteItems = _allFavouriteItems.where((value) {
        final type = value.item?.Type?.toLowerCase();
        return currentTab == FavouriteTapBarENUM.SELL
            ? type == 'sell'
            : type == 'swap';
      }).toList();

      // Handle from product screen
      if (event.isFromProdScreen) {
        if (event.isFavouriteFromProd) {
          isFavouriteItem = true;
        }

        // Look for the item in ALL favorites (not just filtered ones)
        final matchedItem = _allFavouriteItems.firstWhere(
          (value) => value.item?.id == event.itemID,
          orElse: () => FavouriteResponseModelData(),
        );

        favouriteItemId = matchedItem.id ?? 0;
      }

      emit(FavouriteLoadedState());
    });
  }

  FutureOr<void> _removeFavouriteItem(
      RemoveFavouriteEvent event, Emitter<FavouriteState> emit) async {
    emit(FavouriteLoadingState());

    int favoriteRecordId = event.itemId;

    // If actualItemId is provided, we need to find the favorite record ID by looking up the item
    if (event.actualItemId != null) {
      final matchedFavorite = _allFavouriteItems.firstWhere(
        (fav) => fav.item?.id == event.actualItemId,
        orElse: () => FavouriteResponseModelData(),
      );

      if (matchedFavorite.id != null && matchedFavorite.id! > 0) {
        favoriteRecordId = matchedFavorite.id!;
      } else {
        ShowToastSnackBar.showSnackBars(
            message: "Cannot remove favorite: Item not found in favorites",
            isError: true);
        emit(FavouriteLoadedState());
        return;
      }
    }

    // Validate favoriteRecordId before making API call
    if (favoriteRecordId <= 0) {
      ShowToastSnackBar.showSnackBars(
          message: "Cannot remove favorite: Invalid ID", isError: true);
      emit(FavouriteLoadedState());
      return;
    }

    final result = await getIt
        .get<FavouriteUseCases>()
        .removeFavouriteItem(favoriteRecordId);

    result.fold((l) {
      emit(FavouriteErrorState(message: l.message.toString()));
      ShowToastSnackBar.showSnackBars(
          message: l.message.toString(), isError: true);
    }, (r) {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(
            message: r.message.toString(), isError: true);
        emit(FavouriteLoadedState());
        return;
      }
      ShowToastSnackBar.showSnackBars(
          message: "Item removed from favourite", isSuccess: true);

      // Find the item to get its ID for updating the source blocs
      final item = _allFavouriteItems.firstWhere(
        (fav) => fav.id == favoriteRecordId,
        orElse: () => FavouriteResponseModelData(),
      );

      if (item.item?.id != null) {
        final itemId = item.item!.id!;
        final itemType = item.item!.Type?.toLowerCase();

        // Update the source blocs to reflect the favorite removal
        if (itemType == 'sell') {
          // Update TodayDealsBloc for sell items
          try {
            TodayDealsBloc.get.add(UpdateTodayDealsItemFavoriteEvent(
              id: itemId,
              isFavorite: false,
            ));
          } catch (e) {
            // Handle case where bloc might not be available
          }
        } else if (itemType == 'swap') {
          // Update TrendDealsBloc for swap items
          try {
            TrendDealsBloc.get.add(UpdateTrendDealsItemFavoriteEvent(
              id: itemId,
              isFavorite: false,
            ));
          } catch (e) {
            // Handle case where bloc might not be available
          }
        }
      }

      // Update local lists and emit state
      _allFavouriteItems.removeWhere((fav) => fav.id == favoriteRecordId);

      // Re-filter the favouriteItems based on currentTab after removal
      favouriteItems = _allFavouriteItems.where((value) {
        final type = value.item?.Type?.toLowerCase();
        return currentTab == FavouriteTapBarENUM.SELL
            ? type == 'sell'
            : type == 'swap';
      }).toList();

      emit(FavouriteLoadedState());
    });
  }

  FutureOr<void> _addFavouriteItem(
      AddFavouriteEvent event, Emitter<FavouriteState> emit) async {
    final result = await getIt
        .get<FavouriteUseCases>()
        .addFavouriteItem(ValueConstants.userId, event.itemId);

    result.fold((l) {
      emit(FavouriteErrorState(message: l.message.toString()));
    }, (r) {
      if (!r.status!) {
        ShowToastSnackBar.showSnackBars(
            message: r.message.toString(), isError: true);
        return;
      }
      ShowToastSnackBar.showSnackBars(
          message: "Item added to favourite", isSuccess: true);

      // Update the source blocs to reflect the favorite addition
      // Since we know the itemId, we need to determine if it's a sell or swap item
      // We can try updating both blocs safely with try-catch
      try {
        TodayDealsBloc.get.add(UpdateTodayDealsItemFavoriteEvent(
          id: event.itemId,
          isFavorite: true,
        ));
      } catch (e) {
        // Handle case where bloc might not be available or item not found
      }

      try {
        TrendDealsBloc.get.add(UpdateTrendDealsItemFavoriteEvent(
          id: event.itemId,
          isFavorite: true,
        ));
      } catch (e) {
        // Handle case where bloc might not be available or item not found
      }

      // Refresh the list after addition
      add(GetFavouriteDataEvent());
    });
  }

  FutureOr<void> _searchFavouriteItems(
      SearchFavouriteItemsEvent event, Emitter<FavouriteState> emit) async {
    final query = event.searchQuery.trim().toLowerCase();

    favouriteItems = _allFavouriteItems.where((value) {
      final title = value.item?.Title?.toLowerCase() ?? '';
      final type = value.item?.Type?.toLowerCase() ?? '';

      final matchesType = currentTab == FavouriteTapBarENUM.SELL
          ? type == 'sell'
          : type == 'swap';

      final matchesQuery = title.contains(query);

      if (query.isEmpty) {
        // No search text, filter only by tab type
        return matchesType;
      } else {
        // Filter by both tab type and search query
        return matchesType && matchesQuery;
      }
    }).toList();

    emit(FavouriteLoadedState());
  }
}
