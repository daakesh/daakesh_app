import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: SwapDatasource)
class RemoteSwapDatasource implements SwapDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/advertisement/getAllAdv',
        params: {"type": "swap"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/section/getSections',
        params: {"type": "swap", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/getCategoryBySection',
        params: {
          "type": "swap",
          "secID": secID.toString(),
          "page": page.toString(),
          "withPaginate": "true"
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID,
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingtype) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemByCategoryId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "catID": catID,
            "Filter": swapFilterDataModel.toJson(),
            "orderBy": {
              "name": "created_at",
              "operation": sortingtype.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsBySubCategoriesID(
      int catID,
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getItemBySubCategoryId',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "subID": catID,
            "Filter": swapFilterDataModel.toJson(),
            "orderBy": {
              "name": "created_at",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSwapSubCategoriesByCatID(
      int catID) async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/subCategory/getSubcategoryByCategoryId',
      params: {"catID": "$catID"},
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/getHandmadeItems',
        params: {"type": "swap", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/brand/getBrands',
        params: {"type": "swap", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getTodaysItems',
          params: {"type": "swap", "page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "type": "swap",
            "owner": "normal",
            "Filter": swapFilterDataModel.toJson(),
            "orderBy": {
              "name": "price",
              "operation": sortingType.name,
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
      "type": "swap",
      "name": searchValue.toString(),
      "page": page.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getMySwapProduct(int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/getItemsByUser',
        params: {"id": ValueConstants.userId, "type": "SWAP", "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> sendOffer(
      String sourceItem,
      String offerItem,
      String comment,
      String sourceUser,
      String offerUser) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/swapOffer/addOffer', body: {
      "source_item": sourceItem,
      "offer_item": offerItem,
      "note": comment,
      "approved": "0",
      "source_user": sourceUser,
      "offer_user": offerUser
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
  Future<Either<Failure, ValidResponse>> getCities() async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/item/getCites');
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue,
      SwapFilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getSearchItemsResult',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            {
              "Filter": filterDataModel.toJson(),
              "name": searchValue,
              "orderBy": {
                "name": "created_at",
                "operation": sortingType.name,
              },
            },
          ),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getOfferedItems(
      SwapFilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/getOfferedItems',
          params: {"page": "$page"},
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "Filter": filterDataModel.toJson(),
            "orderBy": {
              "name": "created_at",
              "operation": sortingType.name,
            },
          }),
        );
    return result;
  }
}
