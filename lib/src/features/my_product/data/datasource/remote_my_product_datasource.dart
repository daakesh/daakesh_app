import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;


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
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel) async {
    final result = await getIt.get<NetworkService>().post(
        path: 'DaakeshServices/api/item/addItem',
      body: {
        "userID": '${addProModel.userID}',
        "title": "${addProModel.title}",
        "description":'${addProModel.description}',
        "secID": '${addProModel.secID}',
        "catID": '${addProModel.catID}',
        "subID": '${addProModel.subID}',
        "brandID": '${addProModel.brandID}',
        "year":"${addProModel.year}",
        "quantity":'${addProModel.quantity}',
        "discount":'${addProModel.discount}',
        "discount_from":'${addProModel.discountFrom}',
        "discount_to":'${addProModel.discountTo}',
        "tradeOrSell": '${addProModel.tradeOrSell}',
        "price": '${addProModel.price}',
        "country":"${addProModel.country}",
        "display":'${addProModel.display}',
        "country_swap":"${addProModel.countrySwap}",
        "city_swap":"${addProModel.citySwap}",
        "city":"${addProModel.citySwap}",
        "itemImg":['${convertImgToBas64(addProModel.itemImg!.first.path)}'].toString(),
        "tradeFor": "TV",
        "condition": "New"
        }
    );





    return result;
  }
  // dynamic convertToBase64(File file) {
  //   List<int> imageBytes = file.readAsBytesSync();
  //   String base64Image = base64Encode(imageBytes);
  //   return base64Image;
  // }
  Future<String> convertImgToBas64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    final String img64 = base64Encode(bytes);
    return img64;
  }



}