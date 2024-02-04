import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';


abstract class HomeUseCases {
  Future<Either<Failure,ValidResponse>> onLogin();
}

@dev
@LazySingleton(as: HomeUseCases)
class HomeUseCasesImpl implements HomeUseCases {
  @override
  Future<Either<Failure, ValidResponse>> onLogin() async {
    return await getIt.get<HomeRepository>().getData();
  }
}


