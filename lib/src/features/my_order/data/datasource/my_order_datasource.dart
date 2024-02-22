import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class MyOrderDatasource {
  Future<Either<Failure, ValidResponse>> updateUserData();

}

