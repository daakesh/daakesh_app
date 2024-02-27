import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    return await getIt.get<HomeDatasource>().getAdvertisementData();
  }  @override
  Future<Either<Failure, ValidResponse>> getSectionData() async {
    return await getIt.get<HomeDatasource>().getSectionData();
  }
  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData() async {
    return await getIt.get<HomeDatasource>().getHandmadeData();
  } @override
  Future<Either<Failure, ValidResponse>> getBrandsData() async {
    return await getIt.get<HomeDatasource>().getBrandsData();
  }
  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData() async {
    return await getIt.get<HomeDatasource>().getTodayItemsData();
  }


  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage) async {
    return await getIt.get<HomeDatasource>().searchOnItems(searchValue,page,perPage);
  }
}