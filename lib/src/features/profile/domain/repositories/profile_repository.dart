import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../services/services.export.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage);
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber);

}