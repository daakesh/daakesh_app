import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class {{feature_name.pascalCase()}}UseCases {
  Future<Either<Failure,ValidResponse>> method();

}

@dev
@LazySingleton(as: {{feature_name.pascalCase()}}UseCases)
class {{feature_name.pascalCase()}}UseCasesImpl implements {{feature_name.pascalCase()}}UseCases {

  @override
  Future<Either<Failure, ValidResponse>> method() async {
    return await getIt.get<{{feature_name.pascalCase()}}Repository>().method();
  }

}



