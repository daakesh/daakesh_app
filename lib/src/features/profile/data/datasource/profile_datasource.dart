import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class ProfileDatasource {
  Future<Either<Failure, ValidResponse>> updateUserData();

}

