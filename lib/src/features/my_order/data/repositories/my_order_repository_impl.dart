import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: MyOrderRepository)
class MyOrderRepositoryImpl implements MyOrderRepository {
  @override
  Future<Either<Failure, ValidResponse>> getMyOrders() async {
    return await getIt.get<MyOrderDatasource>().getMyOrders();
  }

  @override
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(
      String type, int page) async {
    return await getIt
        .get<MyOrderDatasource>()
        .getSendReceiveSwapRequest(type, page);
  }

  @override
  Future<Either<Failure, ValidResponse>> updateOffer(
      int itemId, int approved, String comment) async {
    return await getIt
        .get<MyOrderDatasource>()
        .updateOffer(itemId, approved, comment);
  }

  @override
  Future<Either<Failure, ValidResponse>> startSwap(
      StartSwapModel startSwapModel) async {
    return await getIt.get<MyOrderDatasource>().startSwap(startSwapModel);
  }

  @override
  Future<Either<Failure, ValidResponse>> removeOffer(int id) async {
    return await getIt.get<MyOrderDatasource>().removeOffer(id);
  }
}
