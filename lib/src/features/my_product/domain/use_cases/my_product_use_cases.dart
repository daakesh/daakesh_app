import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyProductUseCases {
  Future<Either<Failure, ValidResponse>> getMyProduct(int page, String type);
  Future<Either<Failure, ValidResponse>> getSections();
  Future<Either<Failure, ValidResponse>> getCategoryBySection(int secID);
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(int catID);
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(int catID);
  Future<Either<Failure, ValidResponse>> getBrandsBySection(int secID);
  Future<Either<Failure, ValidResponse>> searchOnProduct(
      String searchValue, int page, ProductTapBar type);
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel);
  Future<Either<Failure, ValidResponse>> updateProduct(AddProModel addProModel);
  Future<Either<Failure, ValidResponse>> getSellerInfo();
  Future<Either<Failure, ValidResponse>> updateSellerInfo(
      String phoneNumber, String userName, String whatsappNumber);
  Future<Either<Failure, ValidResponse>> getItemById(int id);
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue);
  Future<Either<Failure, ValidResponse>> removeProduct(int id);
}

@dev
@LazySingleton(as: MyProductUseCases)
class MyProductUseCasesImpl implements MyProductUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getMyProduct(
      int page, String type) async {
    return await getIt.get<MyProductRepository>().getMyProduct(page, type);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSections() async {
    return await getIt.get<MyProductRepository>().getSections();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySection(int secID) async {
    return await getIt.get<MyProductRepository>().getCategoryBySection(secID);
  }

  @override
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(int catID) async {
    return await getIt.get<MyProductRepository>().isCategoryHasSub(catID);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(
      int catID) async {
    return await getIt
        .get<MyProductRepository>()
        .getSubcategoryByCategoryId(catID);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsBySection(int secID) async {
    return await getIt.get<MyProductRepository>().getBrandsBySection(secID);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnProduct(
      String searchValue, int page, ProductTapBar type) async {
    return await getIt
        .get<MyProductRepository>()
        .searchOnProduct(searchValue, page, type);
  }

  @override
  Future<Either<Failure, ValidResponse>> addProduct(
      AddProModel addProModel) async {
    return await getIt.get<MyProductRepository>().addProduct(addProModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateProduct(
      AddProModel addProModel) async {
    return await getIt.get<MyProductRepository>().updateProduct(addProModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSellerInfo() async {
    return await getIt.get<MyProductRepository>().getSellerInfo();
  }

  @override
  Future<Either<Failure, ValidResponse>> updateSellerInfo(
      String phoneNumber, String userName, String whatsappNumber) async {
    return await getIt
        .get<MyProductRepository>()
        .updateSellerInfo(phoneNumber, userName, whatsappNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemById(int id) async {
    return await getIt.get<MyProductRepository>().getItemById(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeProduct(int id) async {
    return await getIt.get<MyProductRepository>().removeProduct(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    return await getIt.get<MyProductRepository>().addComment(
          userId,
          itemId,
          commentDesc,
          catID,
          subID,
          rateValue,
        );
  }
}
