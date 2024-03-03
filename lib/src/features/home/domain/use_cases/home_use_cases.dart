import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


abstract class HomeUseCases {
  Future<Either<Failure,ValidResponse>> getAdvertisementData();
  Future<Either<Failure,ValidResponse>> getSectionData();
  Future<Either<Failure,ValidResponse>> getCategoryBySectionID(int secID,int page);
  Future<Either<Failure,ValidResponse>> getHandmadeData(int page);
  Future<Either<Failure,ValidResponse>> getBrandsData(int page);
  Future<Either<Failure,ValidResponse>> getTodayItemsData(int page);
  Future<Either<Failure,ValidResponse>> searchOnItems(String searchValue,int page,int perPage);
  ///Comment API
  Future<Either<Failure, ValidResponse>> addComment(int userId,int itemId,String commentDesc);
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID);
  Future<Either<Failure, ValidResponse>> removeComments(int id);
  Future<Either<Failure, ValidResponse>> editComments(int id,String commentDesc);
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
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(int secID,int page) async {
    return await getIt.get<HomeRepository>().getCategoryBySectionID(secID,page);
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
  Future<Either<Failure, ValidResponse>> getTodayItemsData(int page) async {
    return await getIt.get<HomeRepository>().getTodayItemsData(page);
  }
  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage) async {
    return await getIt.get<HomeRepository>().searchOnItems(searchValue,page,perPage);
  }
  ///Comment API.
  @override
  Future<Either<Failure, ValidResponse>> addComment(int userId, int itemId, String commentDesc) async{
    return await getIt.get<HomeRepository>().addComment(userId,itemId,commentDesc);
  }
  @override
  Future<Either<Failure, ValidResponse>> editComments(int id, String commentDesc) async{
    return await getIt.get<HomeRepository>().editComments(id,commentDesc);
  }
  @override
  Future<Either<Failure, ValidResponse>> getCommentsByItem(int itemID) async{
    return await getIt.get<HomeRepository>().getCommentsByItem(itemID);
  }
  @override
  Future<Either<Failure, ValidResponse>> removeComments(int id) async{
    return await getIt.get<HomeRepository>().removeComments(id);
  }

}


