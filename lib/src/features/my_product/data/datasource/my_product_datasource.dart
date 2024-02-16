import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class MyProductDatasource {
  Future<Either<Failure, ValidResponse>> updateUserData();

}

