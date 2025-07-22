import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HomeDatasource)
class RemoteHomeDatasource implements HomeDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    final result = await getIt.get<NetworkService>().get(
          path: 'DaakeshServices/api/advertisement/getAllAdv',
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/section/getSections',
        params: {"page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/getCategoryBySection',
        params: {
          "secID": secID.toString(),
          "page": page.toString(),
          "withPaginate": "true",
          "type": "sell"
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemByCategoryId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "catID": catID,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemBySubCategoryID(
      int subID,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemBySubCategoryId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "subID": subID,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategories(int catID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/subCategory/getSubcategoryByCategoryId',
        params: {"catID": "$catID"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(
    FilterDataModel filterDataModel,
    int page,
    SortingType sortingType,
  ) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getHandmadeItems',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/brand/getBrands', params: {"page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemByBrandId',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          params: {"page": "$page"},
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "brandID": "$brandId",
            "Filter": {"Type": "Sell"},
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      FilterDataModel filterDataModel,
      HomeTodayItemType type,
      int page,
      SortingType sortingType) async {
    // Get fresh Firebase messaging token
    String deviceToken = '';
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      deviceToken = fcmToken ?? '';
    } catch (e) {
      print('🔥 Error getting FCM token: $e');
      deviceToken = GetItUtils.user.userData.deviceToken ?? '';
    }

    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getTodaysItems',
          params: {"type": type.name, "page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "type": "sell",
            "owner": "normal",
            "deviceToken": deviceToken,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": "$sortingType",
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/item/SearchItems', params: {
      "name": searchValue,
      "type": "sell",
      "page": '$page',
    });
    return result;
  }

  ///Comments API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/comment/addCommentWithRate', params: {
      "lang": ValueConstants.language
    }, body: {
      "userID": userId,
      "itemID": "$itemId",
      "commentDesc": commentDesc,
      "catID": "$catID",
      "subID": "$subID",
      "rateValue": "$rateValue",
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/comment/updateComment', params: {
      "id": "$id",
      "commentDesc": commentDesc,
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(
      int itemID, int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/comment/getCommentsByItem',
        params: {"itemID": "$itemID", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/comment/removeComment',
        params: {"id": "$id"});
    return result;
  }

  ///Rate API.
  @override
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, String userId, int catID, double rateValue) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/rate/addRate', body: {
      "itemID": "$itemId",
      "userID": userId,
      "catID": "$catID",
      "rateValue": "$rateValue",
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getRateByItem(
      int itemId, int userId) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/rate/getItemRate', params: {
      "itemID": "$itemId",
      "userID": "$userId",
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/rate/updateRate', params: {
      "id": "$id",
      "rateValue": "$rateValue",
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/cart/addCart', body: {
      "user_id": ValueConstants.userId,
      "item_id": itemID,
      "country": country,
      "address": address,
      "quantity": "1",
      "delivery_fee": "1"
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/cart/deleteCart', params: {"id": itemID});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCartItemsByUser() async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/cart/getMyCart', params: {
      "user_id": ValueConstants.userId,
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity) async {
    final result = await getIt.get<NetworkService>().post(
        path: 'DaakeshServices/api/cart/updateCart',
        body: {
          "id": id,
          "user_id": userID,
          "item_id": itemID,
          "quantity": quantity
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/orders/addOrders',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(orderList),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCities() async {
    final result = await getIt.get<NetworkService>().get(
          path: 'DaakeshServices/api/item/getCites',
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentCountItem(int itemId) async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/item/getItemDetails',
      params: {
        "id": "$itemId",
        "userID": ValueConstants.userId,
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getOverAllRateItem(int itemId) async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/rate/getOverallRateForItem',
      params: {
        "itemID": "$itemId",
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrandID(
      int brandID,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemByBrandId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "brandID": brandID,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getSearchItemsResult',
          params: {"page": "$page", "userID": ValueConstants.userId},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "Filter": filterDataModel.toJson(),
            "name": searchValue,
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getAllTodayItems(
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getOfferedItems',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "userID": ValueConstants.userId,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> clickAdv(
      String userID, String advID) async {
    final result = await getIt.get<NetworkService>().post(
      path: 'DaakeshServices/api/advertisement/clickAdv',
      body: {
        "user_id": userID,
        "adv_id": advID,
      },
    );
    return result;
  }
}
