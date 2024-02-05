import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class AuthDatasource {
  Future<Either<Failure, ValidResponse>> onLogin(String phoneNumber,String passwordNumber);
}