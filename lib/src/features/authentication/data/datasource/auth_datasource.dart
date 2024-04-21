import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class AuthDatasource {
  Future<Either<Failure, ValidResponse>> onLogin(String email,String passwordNumber);
  Future<Either<Failure, ValidResponse>> addUser(String name,String email,String password,String phoneNumber,String userType);
  Future<Either<Failure, ValidResponse>> activateUser(String id);
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(String phoneNumber);
  Future<Either<Failure, ValidResponse>> updatePassword(String phoneNumber,String password);
  Future<Either<Failure, ValidResponse>> getUserData();
  Future<Either<Failure, ValidResponse>> logout();
}

