import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage) async {
    return await getIt.get<ProfileDatasource>().updateUserData(name,profileImage);
  }
  @override
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber) async {
    return await getIt.get<ProfileDatasource>().updateUserPassword(password,phoneNumber);
  }




}