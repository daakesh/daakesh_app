import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class MyOrderUseCases {
  Future<Either<Failure, ValidResponse>> getMyOrders();
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(
      String type, int page);
  Future<Either<Failure, ValidResponse>> updateOffer(
    int itemId,
    int approved,
    String comment,
  );
  Future<Either<Failure, ValidResponse>> startSwap(
      StartSwapModel startSwapModel);
  Future<Either<Failure, ValidResponse>> removeOffer(int id);
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
      String type, int page) async {
    return await getIt
        .get<MyOrderRepository>()
        .getSendReceiveSwapRequest(type, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateOffer(
      int itemId, int approved, String comment) async {
    return await getIt
        .get<MyOrderRepository>()
        .updateOffer(itemId, approved, comment);
  }

  @override
  Future<Either<Failure, ValidResponse>> startSwap(
      StartSwapModel startSwapModel) async {
    return await getIt.get<MyOrderRepository>().startSwap(startSwapModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeOffer(int id) async {
    return await getIt.get<MyOrderRepository>().removeOffer(id);
  }
}
