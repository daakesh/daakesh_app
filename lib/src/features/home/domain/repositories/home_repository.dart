import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class HomeRepository {
  Future<Either<Failure, ValidResponse>> getData();
}