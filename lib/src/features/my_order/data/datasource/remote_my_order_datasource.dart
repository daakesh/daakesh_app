import 'package:daakesh/src/features/my_order/data/models/start_swap_model.dart';
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
      String type, int page) async {
    final result = await getIt.get<NetworkService>().get(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/swapOffer/getUserOffers',
        params: {
          "userID": ValueConstants.userId,
          "type": type,
          "page": "$page"
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> updateOffer(
      int itemId, int approved, String comment) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/swapOffer/updateOffer',
        body: {
          "id": "$itemId",
          "approved": "$approved",
          "note": comment,
        });
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> startSwap(
      StartSwapModel startSwapModel) async {
    final result = await getIt.get<NetworkService>().post(
        baseUrl: NetworkConstants.baseUrl,
        path: 'DaakeshServices/api/swapOffer/addOffer',
        body: startSwapModel.toJson());
    return result;
  }

  @override
  Future<Either<Failure, ValidResponse>> removeOffer(int id) async {
    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: 'DaakeshServices/api/swapOffer/deleteOffer',
      params: {"id": "$id"},
    );
    return result;
  }
}
