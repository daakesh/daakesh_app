import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class HomeDatasource {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData(int page);
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page);
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(int catID,
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getItemBySubCategoryID(int subID,
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getHandmadeData(
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId);
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      FilterDataModel filterDataModel,
      HomeTodayItemType type,
      int page,
      SortingType sortingType);
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage);

  ///Comment API
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue);
  Future<Either<Failure, ValidResponse>> getCommentsByItem(
      int itemID, int page);
  Future<Either<Failure, ValidResponse>> removeComments(int id);
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc);

  ///Rate API
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

  ///Add order
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList);
  Future<Either<Failure, ValidResponse>> getCities();
  Future<Either<Failure, ValidResponse>> getCommentCountItem(int itemId);
  Future<Either<Failure, ValidResponse>> getOverAllRateItem(int itemId);
  Future<Either<Failure, ValidResponse>> getItemsByBrandID(int brandID,
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getAllTodayItems(
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getSubCategories(int catID);
  Future<Either<Failure, ValidResponse>> clickAdv(String userID, String advID);
}
