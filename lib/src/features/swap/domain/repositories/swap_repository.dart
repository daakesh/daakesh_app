import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class SwapRepository {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData(int page);
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page);
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, SwapFilterDataModel swapFilterDataModel, int page);
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getTodayItemsData(int page);
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage);
  Future<Either<Failure, ValidResponse>> getMySwapProduct(int page);
  Future<Either<Failure, ValidResponse>> sendOffer(String sourceItem,
      String offerItem, String comment, String sourceUser, String offerUser);

  ///Comment API
  Future<Either<Failure, ValidResponse>> addComment(
      int userId, int itemId, String commentDesc);
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID);
  Future<Either<Failure, ValidResponse>> removeComments(int id);
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc);

  ///Rate API
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, int userId, int catID, int rateValue);
  Future<Either<Failure, ValidResponse>> getRateByItem(int itemId, int userId);
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue);
  Future<Either<Failure, ValidResponse>> getCities();
}
