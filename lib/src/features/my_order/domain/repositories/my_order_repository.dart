import 'package:dartz/dartz.dart';
import '../../../../services/services.export.dart';

abstract class MyOrderRepository {
  Future<Either<Failure, ValidResponse>> getMyOrders();
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(String type);
}
