import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: NotificationsDatasource)
class RemoteNotificationsDatasource implements NotificationsDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(
      String userId) async {
    final result = await getIt.get<NetworkService>().get(
      baseUrl: 'www.daakesh.com',
      path: 'DaakeshServices/api/notification/getNotificationsByUser',
      params: {'userID': userId},
    );
    return result;
  }
}
