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
    print('currentTab: $currentTab');
    emit(FavouriteTabBarChangedState());
    add(GetFavouriteDataEvent());
  }

  FutureOr<void> _onSetItemFavourite(
      SetFavouriteEvent event, Emitter<FavouriteState> emit) {
    isFavouriteItem = !isFavouriteItem;
    print('isFavouriteItem: $isFavouriteItem');
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

      print('Filtered favouriteItems: $favouriteItems');

      // Handle from product screen
      if (event.isFromProdScreen && favouriteItems.isNotEmpty) {
        if (event.isFavouriteFromProd) {
          isFavouriteItem = true;
        }

        final matchedItem = favouriteItems.firstWhere(
          (value) => value.item?.id == event.itemID,
          orElse: () => FavouriteResponseModelData(),
        );

        favouriteItemId = matchedItem.id ?? 0;
        print('Matched favouriteItemId: $favouriteItemId');
      }

      emit(FavouriteLoadedState());
    });
  }

  FutureOr<void> _removeFavouriteItem(
      RemoveFavouriteEvent event, Emitter<FavouriteState> emit) async {
    final result =
        await getIt.get<FavouriteUseCases>().removeFavouriteItem(event.itemId);

    result.fold((l) {
      emit(FavouriteErrorState(message: l.message.toString()));
    }, (r) {
      if (!r.status!) {
        ShowToastSnackBar.showErrorDialog(message: r.message.toString());
        return;
      }
      ShowToastSnackBar.showSuccessDialog(message: r.message ?? "Item Deleted");
      // Refresh the list after removal
      add(GetFavouriteDataEvent());
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
        ShowToastSnackBar.showErrorDialog(message: r.message.toString());
        return;
      }
      ShowToastSnackBar.showSuccessDialog(message: r.message ?? "Item Added");
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
