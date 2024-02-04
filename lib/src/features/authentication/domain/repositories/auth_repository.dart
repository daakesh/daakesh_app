import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class AuthRepository {
  Future<Either<Failure, ValidResponse>> onLogin();
}