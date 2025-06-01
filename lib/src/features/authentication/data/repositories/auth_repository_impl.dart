import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(
      String email, String passwordNumber) async {
    return await getIt.get<AuthDatasource>().onLogin(email, passwordNumber);
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
    double latitude,
    double longitude,
    String deviceToken,
  ) async {
    return await getIt.get<AuthDatasource>().addUser(
          name,
          email,
          password,
          phoneNumber,
          userType,
          country,
          city,
          address,
          latitude,
          longitude,
          deviceToken,
        );
  }

  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id) async {
    return await getIt.get<AuthDatasource>().activateUser(id);
  }

  @override
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(
      String phoneNumber) async {
    return await getIt.get<AuthDatasource>().isPhoneNumberExist(phoneNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> updatePassword(
      String phoneNumber, String password, String email) async {
    return await getIt
        .get<AuthDatasource>()
        .updatePassword(phoneNumber, password, email);
  }

  @override
  Future<Either<Failure, ValidResponse>> getUserData() async {
    return await getIt.get<AuthDatasource>().getUserData();
  }

  @override
  Future<Either<Failure, ValidResponse>> logout() async {
    return await getIt.get<AuthDatasource>().logout();
  }

  @override
  Future<Either<Failure, ValidResponse>> removeAccount() async {
    return await getIt.get<AuthDatasource>().removeAccount();
  }
}
