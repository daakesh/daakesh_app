import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class SwapUseCases {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData();
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
}

@dev
@LazySingleton(as: SwapUseCases)
class SwapUseCasesImpl implements SwapUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<SwapRepository>().getAdvertisementData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData() async {
    return await getIt.get<SwapRepository>().getSectionData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    return await getIt
        .get<SwapRepository>()
        .getCategoryBySectionID(secID, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, SwapFilterDataModel swapFilterDataModel, int page) async {
    return await getIt
        .get<SwapRepository>()
        .getSubCategoryByCatID(catID, swapFilterDataModel, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page) async {
    return await getIt.get<SwapRepository>().getHandmadeData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    return await getIt.get<SwapRepository>().getBrandsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(int page) async {
    return await getIt.get<SwapRepository>().getTodayItemsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    return await getIt
        .get<SwapRepository>()
        .searchOnItems(searchValue, page, perPage);
  }

  @override
  Future<Either<Failure, ValidResponse>> getMySwapProduct(int page) async {
    return await getIt.get<SwapRepository>().getMySwapProduct(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> sendOffer(
      String sourceItem,
      String offerItem,
      String comment,
      String sourceUser,
      String offerUser) async {
    return await getIt
        .get<SwapRepository>()
        .sendOffer(sourceItem, offerItem, comment, sourceUser, offerUser);
  }

  ///Comment API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(
      int userId, int itemId, String commentDesc) async {
    return await getIt
        .get<SwapRepository>()
        .addComment(userId, itemId, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    return await getIt.get<SwapRepository>().editComments(id, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID) async {
    return await getIt.get<SwapRepository>().getCommentsByItem(itemID);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async {
    return await getIt.get<SwapRepository>().removeComments(id);
  }

  ///Rate API
  @override
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, int userId, int catID, int rateValue) async {
    return await getIt
        .get<SwapRepository>()
        .addRate(itemId, userId, catID, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue) async {
    return await getIt.get<SwapRepository>().editRate(id, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> getRateByItem(
      int itemId, int userId) async {
    return await getIt.get<SwapRepository>().getRateByItem(itemId, userId);
  }
}
