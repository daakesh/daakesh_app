import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyProductUseCases {
  Future<Either<Failure,ValidResponse>> updateUserData();

}

@dev
@LazySingleton(as: MyProductUseCases)
class MyProductUseCasesImpl implements MyProductUseCases {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData() async {
    return await getIt.get<MyProductRepository>().updateUserData();
  }


}



