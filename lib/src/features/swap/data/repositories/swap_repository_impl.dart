import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: SwapRepository)
class SwapRepositoryImpl implements SwapRepository {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<SwapDatasource>().getAdvertisementData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData(int page) async {
    return await getIt.get<SwapDatasource>().getSectionData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    return await getIt
        .get<SwapDatasource>()
        .getCategoryBySectionID(secID, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID,
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingtype) async {
    return await getIt
        .get<SwapDatasource>()
        .getSubCategoryByCatID(catID, swapFilterDataModel, page, sortingtype);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSwapSubCategoiresByCatID(
      int catID) async {
    return await getIt.get<SwapDatasource>().getSwapSubCategoriesByCatID(catID);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsBySubCategoriesID(
      int subID,
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingtype) async {
    return await getIt.get<SwapDatasource>().getItemsBySubCategoriesID(
        subID, swapFilterDataModel, page, sortingtype);
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page) async {
    return await getIt.get<SwapDatasource>().getHandmadeData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    return await getIt.get<SwapDatasource>().getBrandsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      SwapFilterDataModel swapFilterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<SwapDatasource>()
        .getTodayItemsData(swapFilterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    return await getIt
        .get<SwapDatasource>()
        .searchOnItems(searchValue, page, perPage);
  }

  @override
  Future<Either<Failure, ValidResponse>> getMySwapProduct(int page) async {
    return await getIt.get<SwapDatasource>().getMySwapProduct(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> sendOffer(
      String sourceItem,
      String offerItem,
      String comment,
      String sourceUser,
      String offerUser) async {
    return await getIt
        .get<SwapDatasource>()
        .sendOffer(sourceItem, offerItem, comment, sourceUser, offerUser);
  }

  ///Comment API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(
      int userId, int itemId, String commentDesc) async {
    return await getIt
        .get<SwapDatasource>()
        .addComment(userId, itemId, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    return await getIt.get<SwapDatasource>().editComments(id, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID) async {
    return await getIt.get<SwapDatasource>().getCommentsByItem(itemID);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async {
    return await getIt.get<SwapDatasource>().removeComments(id);
  }

  ///Rate API
  @override
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, int userId, int catID, int rateValue) async {
    return await getIt
        .get<SwapDatasource>()
        .addRate(itemId, userId, catID, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> getRateByItem(
      int itemId, int userId) async {
    return await getIt.get<SwapDatasource>().getRateByItem(itemId, userId);
  }

  @override
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue) async {
    return await getIt.get<SwapDatasource>().editRate(id, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCities() async {
    return await getIt.get<SwapDatasource>().getCities();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue,
      SwapFilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<SwapDatasource>()
        .getSearchItemsResult(searchValue, filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> getOfferedItems(
      SwapFilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<SwapDatasource>()
        .getOfferedItems(filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> clickAdv(
      String userID, String advID) async {
    return await getIt.get<SwapDatasource>().clickAdv(userID, advID);
  }
}
