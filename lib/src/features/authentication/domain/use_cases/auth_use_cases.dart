import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class AuthUseCases {
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
  );
  Future<Either<Failure, ValidResponse>> activateUser(String id);
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(String phoneNumber);
  Future<Either<Failure, ValidResponse>> updatePassword(
      String phoneNumber, String password, String email);
  Future<Either<Failure, ValidResponse>> getUserData();
  Future<Either<Failure, ValidResponse>> logout();
  Future<Either<Failure, ValidResponse>> removeAccount();
}

@dev
@LazySingleton(as: AuthUseCases)
class AuthUseCasesImpl implements AuthUseCases {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(
      String email, String passwordNumber) async {
    return await getIt.get<AuthRepository>().onLogin(email, passwordNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> addUser(
    String name,
    String email,
    String password,
    String phoneNumber,
    String userType,
    String country,
    String city,
    String address,
  ) async {
    return await getIt.get<AuthRepository>().addUser(
          name,
          email,
          password,
          phoneNumber,
          userType,
          country,
          city,
          address,
        );
  }

  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id) async {
    return await getIt.get<AuthRepository>().activateUser(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(
      String phoneNumber) async {
    return await getIt.get<AuthRepository>().isPhoneNumberExist(phoneNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> updatePassword(
      String phoneNumber, String password, String email) async {
    return await getIt
        .get<AuthRepository>()
        .updatePassword(phoneNumber, password, email);
  }

  @override
  Future<Either<Failure, ValidResponse>> getUserData() async {
    return await getIt.get<AuthRepository>().getUserData();
  }

  @override
  Future<Either<Failure, ValidResponse>> logout() async {
    return await getIt.get<AuthRepository>().logout();
  }

  @override
  Future<Either<Failure, ValidResponse>> removeAccount() async {
    return await getIt.get<AuthRepository>().removeAccount();
  }
}
