import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData() async {
    return await getIt.get<ProfileDatasource>().updateUserData();
  }




}