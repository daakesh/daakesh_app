import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class MyOrderDatasource {
  Future<Either<Failure, ValidResponse>> getMyOrders();
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(
      String type, int page);
  Future<Either<Failure, ValidResponse>> updateOffer(
      int itemId, int approved, String comment);
  Future<Either<Failure, ValidResponse>> startSwap(
      StartSwapModel startSwapModel);
  Future<Either<Failure, ValidResponse>> removeOffer(int id);
}
