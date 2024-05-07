import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData(
      String name, XFile? profileImage) async {
    return await getIt
        .get<ProfileDatasource>()
        .updateUserData(name, profileImage);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateUserPassword(
      String password, String phoneNumber) async {
    return await getIt
        .get<ProfileDatasource>()
        .updateUserPassword(password, phoneNumber);
  }

  @override
  Future<Either<Failure, ValidResponse>> addComplaints(String complaintType,
      String sellerName, String subject, String remark) async {
    return await getIt
        .get<ProfileDatasource>()
        .addComplaints(complaintType, sellerName, subject, remark);
  }

  @override
  Future<Either<Failure, ValidResponse>> getAllComplaints() async {
    return await getIt.get<ProfileDatasource>().getAllComplaints();
  }

  @override
  Future<Either<Failure, ValidResponse>> getContactInfo() async {
    return await getIt.get<ProfileDatasource>().getContactInfo();
  }

  @override
  Future<Either<Failure, ValidResponse>> addContactInfo(
      AddContactInfoModel addContactInfoModel) async {
    return await getIt
        .get<ProfileDatasource>()
        .addContactInfo(addContactInfoModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateLocation(
      String country, String city, String address) async {
    return await getIt
        .get<ProfileDatasource>()
        .updateLocation(country, city, address);
  }
}
