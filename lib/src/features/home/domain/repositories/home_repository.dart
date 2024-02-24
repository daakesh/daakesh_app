import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class HomeRepository {
  Future<Either<Failure, ValidResponse>> getAllData();
  Future<Either<Failure, ValidResponse>> searchOnItems(String searchValue,int page,int perPage);
}