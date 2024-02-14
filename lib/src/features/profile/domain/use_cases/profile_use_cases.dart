import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


abstract class ProfileUseCases {
  Future<Either<Failure,ValidResponse>> updateUserData();

}

@dev
@LazySingleton(as: ProfileUseCases)
class ProfileUseCasesImpl implements ProfileUseCases {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData() async {
    return await getIt.get<ProfileRepository>().updateUserData();
  }


}



