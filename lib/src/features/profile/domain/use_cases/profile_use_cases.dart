import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


abstract class ProfileUseCases {
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage);
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber);

}

@dev
@LazySingleton(as: ProfileUseCases)
class ProfileUseCasesImpl implements ProfileUseCases {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage) async {
    return await getIt.get<ProfileRepository>().updateUserData(name,profileImage);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber)async {
    return await getIt.get<ProfileRepository>().updateUserPassword(password,phoneNumber);
  }

}
