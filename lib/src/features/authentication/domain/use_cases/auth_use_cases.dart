import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


abstract class AuthUseCases {
  Future<Either<Failure,ValidResponse>> onLogin(String phoneNumber,String passwordNumber);
  Future<Either<Failure, ValidResponse>> addUser(String name,String email,String password,String phoneNumber,String userType);
  Future<Either<Failure, ValidResponse>> activateUser(String id);
}

@dev
@LazySingleton(as: AuthUseCases)
class AuthUseCasesImpl implements AuthUseCases {

  @override
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber) async {
    return await getIt.get<AuthRepository>().onLogin(phoneNumber,passwordNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> addUser(String name, String email, String password, String phoneNumber, String userType)async{
    return await getIt.get<AuthRepository>().addUser(name,email,password,phoneNumber,userType);
  }

  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id)async{
    return await getIt.get<AuthRepository>().activateUser(id);
  }

}



