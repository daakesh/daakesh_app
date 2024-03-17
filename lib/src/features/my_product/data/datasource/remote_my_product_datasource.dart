import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as:MyProductDatasource)
class RemoteMyProductDatasource implements MyProductDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getMyProduct(int page,String type)async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/item/getItemsByUser',
      params: {
        "id":ValueConstants.userId,
        "type":type,
        "page":"$page"
      }
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getSections() async{
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/section/getSections',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySection(String secID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/getCategoryBySection',
        params: {"secID": secID});
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/category/isCategoryHasSub', params: {
      "catID": catID,
    });
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(String catID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/subCategory/getSubcategoryByCategoryId',
        params: {
          "catID": catID,
        });
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getBrandsBySection(String secID) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/brand/getBrandsBySection',
        params: {
          "secID": secID,
        });
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> searchOnProduct(String searchValue,int page) async {
    final result = await getIt.get<NetworkService>().get(
        path: 'DaakeshServices/api/item/SearchItems',
        params: {
          "name": searchValue,
          "page": '$page',
        });
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel) async {
    AddProModel addProData =addProModel;
     List<String> images = <String>[];
    if (addProModel.itemFileImg!.isNotEmpty) {
      for (var image in addProModel.itemFileImg!) {
        File imagePath = File(image.path);
        final data = await getIt.get<NetworkService>().uploadImage(
            path: 'DaakeshServices/api/item/addItemImages', image: imagePath);
        data.fold((l) {}, (r) =>images.add("${r.data}"),);
      }
    }
    addProData.itemImageList= images;
     final result = await getIt.get<NetworkService>().post(
        path: 'DaakeshServices/api/item/addItem',
        body: addProData.addItemToJson()
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> updateProduct(AddProModel addProModel) async {
    AddProModel addProData =addProModel;
    List<String> images = <String>[];
    if (addProModel.itemFileImg!.isNotEmpty) {
      for (var image in addProModel.itemFileImg!) {
        File imagePath = File(image.path);
        final data = await getIt.get<NetworkService>().uploadImage(
            path: 'DaakeshServices/api/item/addItemImages', image: imagePath);
        data.fold((l) {}, (r) =>images.add(r.data.toString()),);
      }
    }
    addProData.itemImageList= images;
    final result = await getIt.get<NetworkService>().post(
        path: 'DaakeshServices/api/item/updateItem',
        body: addProModel.editItemToJson()
    );
    return result;
  }

}