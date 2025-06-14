import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: MyProductDatasource)
class RemoteMyProductDatasource implements MyProductDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getMyProduct(
      int page, String type) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/getItemsByUser',
        params: {"id": ValueConstants.userId, "type": type, "page": "$page"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSections() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/section/getSections',
      params: {
        "withPaginate": "false",
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySection(int secID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/getCategoryBySection',
        params: {"withPaginate": "false", "secID": secID.toString()});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(int catID) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/category/isCategoryHasSub', params: {
      "catID": catID.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(
      int catID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/subCategory/getSubcategoryByCategoryId',
        params: {
          "withPaginate": "false",
          "catID": catID.toString(),
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsBySection(int secID) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/brand/getBrandsBySection', params: {
      "secID": secID.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnProduct(
      String searchValue, int page, ProductTapBar type) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/item/SearchUserItems', params: {
      "id": ValueConstants.userId,
      "name": searchValue,
      "page": '$page',
      "type": type.name
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addProduct(
      AddProModel addProModel) async {
    AddProModel addProData = addProModel;
    List<String> images = [];
    if (addProModel.itemFileImg!.isNotEmpty) {
      for (var image in addProModel.itemFileImg!) {
        File imagePath = File(image.path);
        final data = await getIt.get<NetworkService>().uploadImage(
            path: 'DaakeshServices/api/item/addItemImages', image: imagePath);
        data.fold(
          (l) {},
          (r) => images.add("${r.data}"),
        );
      }
    }

    addProData.itemImageList = images;
    final result = await getIt.get<NetworkService>().post(
        path: 'DaakeshServices/api/item/addItem',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(addProModel.addItemToJson()));
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateProduct(
      AddProModel addProModel) async {
    AddProModel addProData = addProModel;
    List<String> images = <String>[];
    if (addProModel.itemFileImg!.isNotEmpty) {
      for (var image in addProModel.itemFileImg!) {
        File imagePath = File(image.path);
        final data = await getIt.get<NetworkService>().uploadImage(
            path: 'DaakeshServices/api/item/addItemImages', image: imagePath);
        data.fold(
          (l) {},
          (r) => images.add(r.data.toString()),
        );
      }
    }
    addProData.itemImageList = images;
    addProData.itemImageList?.addAll(addProModel.oldItemImageList!);
    final result = await getIt.get<NetworkService>().post(
          path: 'DaakeshServices/api/item/updateItem',
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(addProModel.editItemToJson()),
        );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSellerInfo() async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/user/getSellerInfo', params: {
      "id": ValueConstants.userId,
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateSellerInfo(
      String phoneNumber, String userName, String whatsappNumber) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/user/UpdateSellerInfo', body: {
      "userID": ValueConstants.userId,
      "phoneNumber": phoneNumber,
      "userName": userName,
      "whatsappNumber": whatsappNumber,
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemById(int id) async {
    final result = await getIt
        .get<NetworkService>()
        .get(path: 'DaakeshServices/api/item/getItemDetails', params: {
      "id": "$id",
      "userID": ValueConstants.userId,
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeProduct(int id) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/deleteItem', params: {"id": "$id"});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/comment/addCommentWithRate', body: {
      "userID": userId,
      "itemID": "$itemId",
      "commentDesc": commentDesc,
      "catID": "$catID",
      "subID": "$subID",
      "rateValue": "$rateValue",
    });
    return result;
  }
}
