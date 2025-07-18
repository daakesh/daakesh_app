import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class AuthDatasource {
  Future<Either<Failure, ValidResponse>> onLogin(
      String email, String passwordNumber);
  Future<Either<Failure, ValidResponse>> addUser(
    String name,
    String email,
    String password,
    String phoneNumber,
    String userType,
    String country,
    String city,
    String address,
    double latitude,
    double longitude,
    String deviceToken,
  );
  Future<Either<Failure, ValidResponse>> activateUser(String id);
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(String phoneNumber);
  Future<Either<Failure, ValidResponse>> updatePassword(
      String phoneNumber, String password, String email);
  Future<Either<Failure, ValidResponse>> getUserData();
  Future<Either<Failure, ValidResponse>> logout();
  Future<Either<Failure, ValidResponse>> removeAccount();
}
