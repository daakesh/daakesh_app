import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: MyOrderDatasource)
class RemoteMyOrderDatasource implements MyOrderDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getMyOrders() async {
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/orders/getMyOrders',
        params: {"user_id": ValueConstants.userId});
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> getSendReceiveSwapRequest(
      String type) async {
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/swapOffer/getUserOffers',
        params: {
          "userID": ValueConstants.userId,
          "type": type,
        });
    return result;
  }
}
