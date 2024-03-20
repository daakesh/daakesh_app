import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';


@LazySingleton(as:ProfileDatasource)
class RemoteProfileDatasource implements ProfileDatasource {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData(String name,XFile? profileImage)async {
      String imageLink = '';
      if(profileImage != null){
        final data = await getIt.get<NetworkService>().uploadImage(
            path: 'DaakeshServices/api/item/addItemImages',
            image: File(profileImage.path));
        data.fold((l) {}, (r) =>imageLink = r.data.toString());
      }

    final result = await getIt.get<NetworkService>().post(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/user/updateUser',
      body: imageLink.isEmpty ?  {
        "id":ValueConstants.userId,
        "name":name,
      }:{
        "id":ValueConstants.userId,
        "name":name,
        "img":imageLink,
      }
    );
    return result;
  }
  @override
  Future<Either<Failure, ValidResponse>> updateUserPassword(String password,String phoneNumber)async {
    final result = await getIt.get<NetworkService>().post(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/user/updatePassword',
      body:{
        "phoneNumber":phoneNumber,
        "password":password,
      }
    );
    return result;
  }


}