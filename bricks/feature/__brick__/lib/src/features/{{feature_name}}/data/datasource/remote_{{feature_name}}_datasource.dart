import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';



@LazySingleton(as: {{feature_name.pascalCase()}}Datasource)
class Remote{{feature_name.pascalCase()}}Datasource implements {{feature_name.pascalCase()}}Datasource {

  @override
  Future<Either<Failure, ValidResponse>> method() async {
    final result = await getIt.get<NetworkService>().post(
        path: '',
        body: {
          "": "",

        }
    );
    return result;
  }

}