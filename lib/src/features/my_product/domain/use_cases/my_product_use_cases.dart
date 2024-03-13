import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyProductUseCases {
  Future<Either<Failure,ValidResponse>> getMyProduct(int page,String type);
  Future<Either<Failure, ValidResponse>> getSections();
  Future<Either<Failure, ValidResponse>> getCategoryBySection(String secID);
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID);
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(String catID);
  Future<Either<Failure, ValidResponse>> getBrandsBySection(String secID);
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel);

}

@dev
@LazySingleton(as: MyProductUseCases)
class MyProductUseCasesImpl implements MyProductUseCases {

  @override
  Future<Either<Failure, ValidResponse>> getMyProduct(int page,String type) async {
    return await getIt.get<MyProductRepository>().getMyProduct(page,type);
  }
  @override
  Future<Either<Failure, ValidResponse>> getSections() async {
    return await getIt.get<MyProductRepository>().getSections();
  }
  @override
  Future<Either<Failure, ValidResponse>> getCategoryBySection(String secID) async{
    return await getIt.get<MyProductRepository>().getCategoryBySection(secID);

  }
  @override
  Future<Either<Failure, ValidResponse>> isCategoryHasSub(String catID) async{
    return await getIt.get<MyProductRepository>().isCategoryHasSub(catID);

  }
  @override
  Future<Either<Failure, ValidResponse>> getSubcategoryByCategoryId(String catID) async{
    return await getIt.get<MyProductRepository>().getSubcategoryByCategoryId(catID);

  }
  @override
  Future<Either<Failure, ValidResponse>> getBrandsBySection(String secID) async{
    return await getIt.get<MyProductRepository>().getBrandsBySection(secID);
  }
  @override
  Future<Either<Failure, ValidResponse>> addProduct(AddProModel addProModel) async{
    return await getIt.get<MyProductRepository>().addProduct(addProModel);
  }


}



