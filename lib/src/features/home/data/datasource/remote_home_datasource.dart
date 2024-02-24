import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as:HomeDatasource )
class RemoteHomeDatasource implements HomeDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getAllData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/index/getAllData',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage) async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/item/SearchItems',
      params: {
        "name":searchValue.toString(),
        "page":page.toString(),
        ///"perPage":perPage.toString(),
      }
    );
    return result;
  }
}