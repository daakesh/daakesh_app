import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


abstract class ProfileUseCases {
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage);
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber);
  Future<Either<Failure, ValidResponse>> addComplaints(String complaintType,String sellerName,String subject,String remark);
  Future<Either<Failure, ValidResponse>> getAllComplaints();
  Future<Either<Failure, ValidResponse>> getContactInfo();
  Future<Either<Failure, ValidResponse>> addContactInfo();
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
  @override
  Future<Either<Failure, ValidResponse>> addComplaints(String complaintType,String sellerName,String subject,String remark)async {
    return await getIt.get<ProfileRepository>().addComplaints(complaintType,sellerName,subject,remark);
  }
  @override
  Future<Either<Failure, ValidResponse>> getAllComplaints() async {
    return await getIt.get<ProfileRepository>().getAllComplaints();
  }
  @override
  Future<Either<Failure, ValidResponse>> getContactInfo() async {
    return await getIt.get<ProfileRepository>().getContactInfo();
  }
  @override
  Future<Either<Failure, ValidResponse>> addContactInfo() async {
    return await getIt.get<ProfileRepository>().addContactInfo();
  }

}
