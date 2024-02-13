import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class AuthRepository {
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber);
  Future<Either<Failure, ValidResponse>> addUser(String name,String email,String password,String phoneNumber,String userType);
  Future<Either<Failure, ValidResponse>> activateUser(String id);
  Future<Either<Failure, ValidResponse>> getUserData();
}