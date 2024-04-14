import 'dart:convert';
import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, ValidResponse>> getSectionData() async {
    final result = await getIt.get<NetworkService>().get(
          path: 'DaakeshServices/api/section/getSections',
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/getCategoryBySection',
        params: {"secID": secID.toString(), "page": page.toString()});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, FilterDataModel filterDataModel, int page) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemByCategoryId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "catID": catID,
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "created_at",
              "operation": "desc",
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/getHandmadeItems',
        params: {"page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/brand/getBrands', params: {"page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/getTodaysItems',
        params: {"type": "sell", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/item/SearchUserItems', params: {
      "name": searchValue.toString(),
      "page": page.toString(),
    });
    return result;
  }

  ///Comments API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(
      int userId, int itemId, String commentDesc) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/comment/addComment', body: {
      "userID": "$userId",
      "itemID": "$itemId",
      "commentDesc": commentDesc,
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
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/comment/getCommentsByItem',
        params: {"itemID": "$itemID"});
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
      int itemId, int userId, int catID, int rateValue) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/rate/addRate', body: {
      "itemID": "$itemId",
      "userID": "$userId",
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
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/favorite/removeFavorite', params: {
      "userID": ValueConstants.userId,
      "itemID": itemID,
    });
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
}
