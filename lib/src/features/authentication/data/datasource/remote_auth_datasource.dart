import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: AuthDatasource)
class RemoteAuthDatasource implements AuthDatasource {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(
      String email, String passwordNumber) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/user/login', body: {
      "email": email.toString(),
      "password": passwordNumber.toString(),
    });
    return result;
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
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/user/addUser', body: {
      "name": name.toString(),
      "phoneNumber": phoneNumber.toString(),
      "password": password.toString(),
      "userType": userType.toString(),
      "email": email.toString(),
      "country": country,
      "city": city,
      "location": address,
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "deviceToken": deviceToken.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> activateUser(String id) async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/user/activateUser',
      params: {
        "id": id.toString(),
      },
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> isPhoneNumberExist(
      String phoneNumber) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/user/isPhoneNumberExist', body: {
      "phoneNumber": phoneNumber.toString(),
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updatePassword(
      String phoneNumber, String password, String email) async {
    final result = await getIt
        .get<NetworkService>()
        .post(path: 'DaakeshServices/api/user/ForgetPassword', body: {
      "phoneNumber": phoneNumber.toString(),
      "password": password.toString(),
      "email": email.toString()
    });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getUserData() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/user/getUserDataByToken',
      params: {"token": ValueConstants.token},
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> logout() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/user/logout',
      params: {"id": ValueConstants.userId},
    );
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeAccount() async {
    final result = await getIt.get<NetworkService>().get(
      path: 'DaakeshServices/api/user/RemoveAccount',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      params: {"id": ValueConstants.userId},
    );
    return result;
  }
}
