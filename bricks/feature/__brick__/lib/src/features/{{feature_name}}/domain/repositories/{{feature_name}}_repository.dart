import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<Either<Failure, ValidResponse>> method();
}