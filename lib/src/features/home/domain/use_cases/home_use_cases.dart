import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';


abstract class HomeUseCases {
  Future<Either<Failure,ValidResponse>> getAllData();
  Future<Either<Failure,ValidResponse>> searchOnItems(String searchValue,int page,int perPage);
}

@dev
@LazySingleton(as: HomeUseCases)
class HomeUseCasesImpl implements HomeUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getAllData() async {
    return await getIt.get<HomeRepository>().getAllData();
  }
  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage) async {
    return await getIt.get<HomeRepository>().searchOnItems(searchValue,page,perPage);
  }
}


