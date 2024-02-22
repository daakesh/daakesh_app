import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


@LazySingleton(as:MyOrderDatasource)
class RemoteMyOrderDatasource implements MyOrderDatasource {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData()async {
    final result = await getIt.get<NetworkService>().post(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/user/login',
      body: {
        "":""
      }
    );
    return result;
  }


}