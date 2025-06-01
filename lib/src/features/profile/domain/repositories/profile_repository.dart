import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../src.export.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ValidResponse>> updateUserData(
      String name, XFile? profileImage, String phoneNumber);
  Future<Either<Failure, ValidResponse>> updateUserPassword(
      String password, String phoneNumber);
  Future<Either<Failure, ValidResponse>> addComplaints(
      String complaintType, String sellerName, String subject, String remark);
  Future<Either<Failure, ValidResponse>> getAllComplaints();
  Future<Either<Failure, ValidResponse>> getContactInfo();
  Future<Either<Failure, ValidResponse>> addContactInfo(
      AddContactInfoModel addContactInfoModel);
  Future<Either<Failure, ValidResponse>> updateLocation(
      String country, String city, String address);
  Future<Either<Failure, ValidResponse>> getLanguageData();
}
