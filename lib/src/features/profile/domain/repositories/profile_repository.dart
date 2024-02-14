import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ValidResponse>> updateUserData();

}