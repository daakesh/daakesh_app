import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyOrderUseCases {
  Future<Either<Failure, ValidResponse>> getMyOrders();
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(String type);
}

@dev
@LazySingleton(as: MyOrderUseCases)
class MyOrderUseCasesImpl implements MyOrderUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getMyOrders() async {
    return await getIt.get<MyOrderRepository>().getMyOrders();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(
      String type) async {
    return await getIt.get<MyOrderRepository>().getSendReceiveSwapRequest(type);
  }
}
