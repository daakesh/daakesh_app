import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyOrderUseCases {
  Future<Either<Failure,ValidResponse>> updateUserData();

}

@dev
@LazySingleton(as: MyOrderUseCases)
class MyOrderUseCasesImpl implements MyOrderUseCases {
  @override
  Future<Either<Failure, ValidResponse>> updateUserData() async {
    return await getIt.get<MyOrderRepository>().updateUserData();
  }


}



