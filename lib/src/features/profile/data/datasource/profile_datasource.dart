import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../services/services.export.dart';

abstract class ProfileDatasource {
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage);
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber);
  ///
  Future<Either<Failure, ValidResponse>> addComplaints(String complaintType,String sellerName,String subject,String remark);
  Future<Either<Failure, ValidResponse>> getAllComplaints();
  ///
  Future<Either<Failure, ValidResponse>> getContactInfo();
  Future<Either<Failure, ValidResponse>> addContactInfo();






}

