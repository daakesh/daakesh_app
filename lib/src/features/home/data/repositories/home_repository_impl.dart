import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, ValidResponse>> getAllData() async {
    return await getIt.get<HomeDatasource>().getAllData();
  }@override
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage) async {
    return await getIt.get<HomeDatasource>().searchOnItems(searchValue,page,perPage);
  }
}