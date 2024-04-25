import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class HomeUseCases {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData();
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page);
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, FilterDataModel filterDataModel, int page);

  Future<Either<Failure, ValidResponse>> getHandmadeData(int page);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      HomeTodayItemType type, int page);
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage);

  ///Comment API
  Future<Either<Failure, ValidResponse>> addComment(
      String userId, int itemId, String commentDesc);
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID);
  Future<Either<Failure, ValidResponse>> removeComments(int id);

  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc);

  ///Rate API
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, String userId, int catID, double rateValue);
  Future<Either<Failure, ValidResponse>> getRateByItem(int itemId, int userId);
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue);

  ///Cart API
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address);
  Future<Either<Failure, ValidResponse>> getCartItemsByUser();
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID);
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity);
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList);
}

@dev
@LazySingleton(as: HomeUseCases)
class HomeUseCasesImpl implements HomeUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<HomeRepository>().getAdvertisementData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData() async {
    return await getIt.get<HomeRepository>().getSectionData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page) async {
    return await getIt
        .get<HomeRepository>()
        .getCategoryBySectionID(secID, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(
      int catID, FilterDataModel filterDataModel, int page) async {
    return await getIt
        .get<HomeRepository>()
        .getSubCategoryByCatID(catID, filterDataModel, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page) async {
    return await getIt.get<HomeRepository>().getHandmadeData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    return await getIt.get<HomeRepository>().getBrandsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      HomeTodayItemType type, int page) async {
    return await getIt.get<HomeRepository>().getTodayItemsData(type, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(
      String searchValue, int page, int perPage) async {
    return await getIt
        .get<HomeRepository>()
        .searchOnItems(searchValue, page, perPage);
  }

  ///Comment API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(
      String userId, int itemId, String commentDesc) async {
    return await getIt
        .get<HomeRepository>()
        .addComment(userId, itemId, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    return await getIt.get<HomeRepository>().editComments(id, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID) async {
    return await getIt.get<HomeRepository>().getCommentsByItem(itemID);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async {
    return await getIt.get<HomeRepository>().removeComments(id);
  }

  ///Rate API
  @override
  Future<Either<Failure, ValidResponse>> addRate(
      int itemId, String userId, int catID, double rateValue) async {
    return await getIt
        .get<HomeRepository>()
        .addRate(itemId, userId, catID, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> editRate(int id, int rateValue) async {
    return await getIt.get<HomeRepository>().editRate(id, rateValue);
  }

  @override
  Future<Either<Failure, ValidResponse>> getRateByItem(
      int itemId, int userId) async {
    return await getIt.get<HomeRepository>().getRateByItem(itemId, userId);
  }

  ///Cart APIs.
  @override
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address) async {
    return await getIt
        .get<HomeRepository>()
        .addToCart(itemID, country, address);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCartItemsByUser() async {
    return await getIt.get<HomeRepository>().getCartItemsByUser();
  }

  @override
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID) async {
    return await getIt.get<HomeRepository>().removeCartItem(itemID);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity) async {
    return await getIt
        .get<HomeRepository>()
        .updateCartItem(id, userID, itemID, quantity);
  }

  @override
  Future<Either<Failure, ValidResponse>> addOrder(
      List<Map<String, dynamic>> orderList) async {
    return await getIt.get<HomeRepository>().addOrder(orderList);
  }
}
