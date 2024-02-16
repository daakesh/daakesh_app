import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class MyProductRepository {
  Future<Either<Failure, ValidResponse>> updateUserData();

}