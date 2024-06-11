import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: ProfileDatasource)
class RemoteProfileDatasource implements ProfileDatasource {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData(
      String name, XFile? profileImage, String phoneNumber) async {
    String imageLink = '';
    if (profileImage != null) {
      final data = await getIt.get<NetworkService>().uploadImage(
          path: 'DaakeshServices/api/item/addItemImages',
          image: File(profileImage.path));
      data.fold((l) {}, (r) => imageLink = r.data.toString());
    }

    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/user/updateUser',
        body: imageLink.isEmpty
            ? {
                "id": ValueConstants.userId,
                "name": name,
                "phoneNumber": phoneNumber
              }
            : {
                "id": ValueConstants.userId,
                "name": name,
                "phoneNumber": phoneNumber,
                "img": imageLink,
              });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateUserPassword(
      String password, String phoneNumber) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/user/updatePassword',
        body: {
          "phoneNumber": phoneNumber,
          "password": password,
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateLocation(
      String country, String city, String address) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/user/updateUser',
        body: {
          "id": ValueConstants.userId,
          "location": '$country, $city, $address',
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addComplaints(String complaintType,
      String sellerName, String subject, String remark) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/complaints/addComplaints',
        body: {
          "user_id": ValueConstants.userId,
          "type": complaintType,
          "seller_name": sellerName,
          "subject": subject,
          "remark": remark,
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getAllComplaints() async {
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/complaints/getAllComplaints');
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getContactInfo() async {
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/contactInfos/getContactInfosByUser',
        params: {"user_id": ValueConstants.userId});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> addContactInfo(
      AddContactInfoModel addContactInfoModel) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/contactInfos/addContactInfo',
        body: addContactInfoModel.toJson());
    return result;
  }
}
