import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class HomeUseCases {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData(int page);
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(
      int secID, int page);
  Future<Either<Failure, ValidResponse>> getSubCategoryByCatID(int catID,
      FilterDataModel filterDataModel, int page, SortingType sortingType);

  Future<Either<Failure, ValidResponse>> getHandmadeData(
      FilterDataModel filterDataModel, int page, SortingType sortingType);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId);

  Future<Either<Failure, ValidResponse>> getTodayItemsData(
      HomeTodayItemType type, int page);
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

  ///Cart API
  Future<Either<Failure, ValidResponse>> addToCart(
      String itemID, String country, String address);
  Future<Either<Failure, ValidResponse>> getCartItemsByUser();
  Future<Either<Failure, ValidResponse>> removeCartItem(String itemID);
  Future<Either<Failure, ValidResponse>> updateCartItem(
      String id, String userID, String itemID, String quantity);
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
}

@dev
@LazySingleton(as: HomeUseCases)
class HomeUseCasesImpl implements HomeUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<HomeRepository>().getAdvertisementData();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSectionData(int page) async {
    return await getIt.get<HomeRepository>().getSectionData(page);
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
      int catID,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<HomeRepository>()
        .getSubCategoryByCatID(catID, filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData(
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<HomeRepository>()
        .getHandmadeData(filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> getBrandsData(int page) async {
    return await getIt.get<HomeRepository>().getBrandsData(page);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrands(
      int page, int brandId) async {
    return await getIt.get<HomeRepository>().getItemsByBrands(page, brandId);
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
  Future<Either<Failure, ValidResponse>> addComment(String userId, int itemId,
      String commentDesc, int catID, int subID, double rateValue) async {
    return await getIt.get<HomeRepository>().addComment(
          userId,
          itemId,
          commentDesc,
          catID,
          subID,
          rateValue,
        );
  }

  @override
  Future<Either<Failure, ValidResponse>> editComments(
      int id, String commentDesc) async {
    return await getIt.get<HomeRepository>().editComments(id, commentDesc);
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(
      int itemID, int page) async {
    return await getIt.get<HomeRepository>().getCommentsByItem(itemID, page);
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

  @override
  Future<Either<Failure, ValidResponse>> getCities() async {
    return await getIt.get<HomeRepository>().getCities();
  }

  @override
  Future<Either<Failure, ValidResponse>> getCommentCountItem(int itemId) async {
    return await getIt.get<HomeRepository>().getCommentCountItem(itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getOverAllRateItem(int itemId) async {
    return await getIt.get<HomeRepository>().getOverAllRateItem(itemId);
  }

  @override
  Future<Either<Failure, ValidResponse>> getItemsByBrandID(
      int brandID,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<HomeRepository>()
        .getItemsByBrandID(brandID, filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> getSearchItemsResult(
      String searchValue,
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<HomeRepository>()
        .getSearchItemsResult(searchValue, filterDataModel, page, sortingType);
  }

  @override
  Future<Either<Failure, ValidResponse>> getAllTodayItems(
      FilterDataModel filterDataModel,
      int page,
      SortingType sortingType) async {
    return await getIt
        .get<HomeRepository>()
        .getAllTodayItems(filterDataModel, page, sortingType);
  }
}
