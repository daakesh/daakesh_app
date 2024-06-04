import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: MyProductRepository)
class MyProductRepositoryImpl implements MyProductRepository {
  @override
  Future<Either<Failure, ValidResponse>> getMyProduct(
      int page, String type) async {
    return await getIt.get<MyProductDatasource>().getMyProduct(page, type);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSections() async {
    return await getIt.get<MyProductDatasource>().getSections();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySection(
      String secID) async {
    return await getIt.get<MyProductDatasource>().getCategoryBySection(secID);
  }

  @override
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID) async {
    return await getIt.get<MyProductDatasource>().isCategoryHasSub(catID);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(
      String catID) async {
    return await getIt
        .get<MyProductDatasource>()
        .getSubcategoryByCategoryId(catID);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsBySection(
      String secID) async {
    return await getIt.get<MyProductDatasource>().getBrandsBySection(secID);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnProduct(
      String searchValue, int page) async {
    return await getIt
        .get<MyProductDatasource>()
        .searchOnProduct(searchValue, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> addProduct(
      AddProModel addProModel) async {
    return await getIt.get<MyProductDatasource>().addProduct(addProModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateProduct(
      AddProModel addProModel) async {
    return await getIt.get<MyProductDatasource>().updateProduct(addProModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSellerInfo() async {
    return await getIt.get<MyProductDatasource>().getSellerInfo();
  }

  @override
  Future<Either<Failure, ValidResponse>> updateSellerInfo(
      String phoneNumber, String userName, String whatsappNumber) async {
    return await getIt
        .get<MyProductDatasource>()
        .updateSellerInfo(phoneNumber, userName, whatsappNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemById(int id) async {
    return await getIt.get<MyProductDatasource>().getItemById(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeProduct(int id) async {
    return await getIt.get<MyProductDatasource>().removeProduct(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    return await getIt
        .get<MyProductDatasource>()
        .addComment(userId, itemId, commentDesc, catID, subID, rateValue);
  }
}
