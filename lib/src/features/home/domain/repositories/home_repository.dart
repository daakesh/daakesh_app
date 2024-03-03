import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class HomeRepository {
  Future<Either<Failure, ValidResponse>> getAdvertisementData();
  Future<Either<Failure, ValidResponse>> getSectionData();
  Future<Either<Failure, ValidResponse>> getCategoryBySectionID(int secID,int page);
  Future<Either<Failure, ValidResponse>> getHandmadeData(int page);
  Future<Either<Failure, ValidResponse>> getBrandsData(int page);
  Future<Either<Failure, ValidResponse>> getTodayItemsData(int page);
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage);
}