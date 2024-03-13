import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class MyProductDatasource {
  Future<Either<Failure, ValidResponse>> getMyProduct(int page,String type);
  Future<Either<Failure, ValidResponse>> getSections();
  Future<Either<Failure, ValidResponse>> getCategoryBySection(String secID);
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID);
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(String catID);
  Future<Either<Failure, ValidResponse>> getBrandsBySection(String secID);
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel);
}

