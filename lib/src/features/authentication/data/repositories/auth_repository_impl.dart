import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber) async {
    return await getIt.get<AuthDatasource>().onLogin(phoneNumber,passwordNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> addUser(String name, String email, String password, String phoneNumber, String userType) async{
    return await getIt.get<AuthDatasource>().addUser(name,email,password,phoneNumber,userType);
  }

  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id) async{
    return await getIt.get<AuthDatasource>().activateUser(id);

  }



}