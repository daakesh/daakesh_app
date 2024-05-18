import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<HomeDatasource>().getAdvertisementData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData(int page) async {
    return await getIt.get<HomeDatasource>().getSectionData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    return await getIt
        .get<HomeDatasource>()
        .getCategoryBySectionID(secID, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, FilterDataModel filterDataModel, int page) async {
    return await getIt
        .get<HomeDatasource>()
        .getSubCategoryByCatID(catID, filterDataModel, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(
      FilterDataModel filterDataModel, int page) async {
    return await getIt
        .get<HomeDatasource>()
        .getHandmadeData(filterDataModel, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    return await getIt.get<HomeDatasource>().getBrandsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId) async {
    return await getIt.get<HomeDatasource>().getItemsByBrands(page, brandId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      HomeTodayItemType type, int page) async {
    return await getIt.get<HomeDatasource>().getTodayItemsData(type, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    return await getIt
        .get<HomeDatasource>()
        .searchOnItems(searchValue, page, perPage);
  }

  ///Comment API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    return await getIt
        .get<HomeDatasource>()
        .addComment(userId, itemId, commentDesc, catID, subID, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    return await getIt.get<HomeDatasource>().editComments(id, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(
      int itemID, int page) async {
    return await getIt.get<HomeDatasource>().getCommentsByItem(itemID, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async {
    return await getIt.get<HomeDatasource>().removeComments(id);
  }

  ///Rate API
  @override
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, String userId, int catID, double rateValue) async {
    return await getIt
        .get<HomeDatasource>()
        .addRate(itemId, userId, catID, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> getRateByItem(
      int itemId, int userId) async {
    return await getIt.get<HomeDatasource>().getRateByItem(itemId, userId);
  }

  @override
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue) async {
    return await getIt.get<HomeDatasource>().editRate(id, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address) async {
    return await getIt
        .get<HomeDatasource>()
        .addToCart(itemID, country, address);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCartItemsByUser() async {
    return await getIt.get<HomeDatasource>().getCartItemsByUser();
  }

  @override
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID) async {
    return await getIt.get<HomeDatasource>().removeCartItem(itemID);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity) async {
    return await getIt
        .get<HomeDatasource>()
        .updateCartItem(id, userID, itemID, quantity);
  }

  @override
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList) async {
    return await getIt.get<HomeDatasource>().addOrder(orderList);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCities() async {
    return await getIt.get<HomeDatasource>().getCities();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentCountItem(int itemId) async {
    return await getIt.get<HomeDatasource>().getCommentCountItem(itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getOverAllRateItem(int itemId) async {
    return await getIt.get<HomeDatasource>().getOverAllRateItem(itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrandID(
      int brandID, FilterDataModel filterDataModel, int page) async {
    return await getIt
        .get<HomeDatasource>()
        .getItemsByBrandID(brandID, filterDataModel, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue, FilterDataModel filterDataModel, int page) async {
    return await getIt
        .get<HomeDatasource>()
        .getSearchItemsResult(searchValue, filterDataModel, page);
  }
}
