import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: {{feature_name.pascalCase()}}Repository)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  @override
  Future<Either<Failure, ValidResponse>> method() async {
    return await getIt.get<{{feature_name.pascalCase()}}Datasource>().method();
  }
}