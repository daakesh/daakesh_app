import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';



@LazySingleton(as:AuthDatasource)
class RemoteAuthDatasource implements AuthDatasource {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber) async {
    final result = await getIt.get<NetworkService>().post(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/user/login',
      body: {
          "phoneNumber": phoneNumber.toString(),
          "password": passwordNumber.toString(),
      }
    );

    // "name":"Alaa-Mohammad",
    // "phoneNumber":"+962789654444",
    // "password":"123456789",
    // "userType":"Normal",
    // "email":"alaa1@gmail.com"
    return result;
  }
}