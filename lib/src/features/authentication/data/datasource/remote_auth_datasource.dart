import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
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
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> addUser(String name, String email, String password, String phoneNumber, String userType) async{
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/user/addUser',
        body: {
          "name":name.toString(),
          "phoneNumber":phoneNumber.toString(),
          "password":password.toString(),
          "userType":userType.toString(),
          "email":email.toString()
        }
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id) async{
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/user/activateUser',
        params: {
          "id": id.toString(),
        },
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> getUserData() async{
    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/user/getUserData',
      userToken: ValueConstants.token,
    );
    return result;
  }

}