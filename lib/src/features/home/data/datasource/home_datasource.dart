import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class HomeDatasource {
  Future<Either<Failure, ValidResponse>> getData();
}