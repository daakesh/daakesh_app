import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber) async {
    return await getIt.get<AuthDatasource>().onLogin(phoneNumber,passwordNumber);
  }
}