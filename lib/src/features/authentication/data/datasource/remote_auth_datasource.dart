import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';



@LazySingleton(as:AuthDatasource )
class RemoteAuthDatasource implements AuthDatasource {
  @override
  Future<Either<Failure, ValidResponse>> onLogin() async {
    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: '',
    );

    return result;
  }
}