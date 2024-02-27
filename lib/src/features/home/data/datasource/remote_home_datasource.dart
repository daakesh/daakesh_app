import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as:HomeDatasource )
class RemoteHomeDatasource implements HomeDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getAdvertisementData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/advertisement/getAllAdv',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getSectionData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/section/getSections',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getHandmadeData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/item/getHandmadeItems',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getBrandsData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/brand/getBrands',
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getTodayItemsData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/item/getTodaysItems',
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