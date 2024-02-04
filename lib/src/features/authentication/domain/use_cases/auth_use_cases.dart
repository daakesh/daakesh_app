import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../services/services.export.dart';
import '../../../../src.export.dart';


abstract class AuthUseCases {
  Future<Either<Failure,ValidResponse>> onLogin();
}

@dev
@LazySingleton(as: AuthUseCases)
class AuthUseCasesImpl implements AuthUseCases {
  @override
  Future<Either<Failure, ValidResponse>> onLogin() async {
    return await getIt.get<AuthRepository>().onLogin();
  }
}

// @test
// @LazySingleton(as:AuthUseCases)
// @GenerateMocks([AuthUseCases])
// class MockAuthUseCasesImpl extends MockAuthUseCases implements AuthUseCases {}

