import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class MyProductRepository {
  Future<Either<Failure, ValidResponse>> getMyProduct(int page, String type);
  Future<Either<Failure, ValidResponse>> getSections();
  Future<Either<Failure, ValidResponse>> getCategoryBySection(String secID);
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID);
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(
      String catID);
  Future<Either<Failure, ValidResponse>> getBrandsBySection(String secID);
  Future<Either<Failure, ValidResponse>> searchOnProduct(
      String searchValue, int page);
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel);
  Future<Either<Failure, ValidResponse>> updateProduct(AddProModel addProModel);
  Future<Either<Failure, ValidResponse>> getSellerInfo();
  Future<Either<Failure, ValidResponse>> updateSellerInfo(
      String phoneNumber, String userName, String whatsappNumber);
  Future<Either<Failure, ValidResponse>> getItemById(int id);
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue);
}
