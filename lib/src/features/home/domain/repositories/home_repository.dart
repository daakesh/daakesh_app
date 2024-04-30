import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class HomeRepository {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData(int page);
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page);
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, FilterDataModel filterDataModel, int page);
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId);
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      HomeTodayItemType type, int page);
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage);

  ///Comment APIs
  Future<Either<Failure, ValidResponse>> addComment(
      String userId, int itemId, String commentDesc);
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID);
  Future<Either<Failure, ValidResponse>> removeComments(int id);
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc);

  ///Rate APIs
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, String userId, int catID, double rateValue);
  Future<Either<Failure, ValidResponse>> getRateByItem(int itemId, int userId);
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue);

  ///Cart APIs
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address);
  Future<Either<Failure, ValidResponse>> getCartItemsByUser();
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID);
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity);
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList);
}
