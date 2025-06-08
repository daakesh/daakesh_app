import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  @override
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(
      String userId) async {
    return await getIt
        .get<NotificationsDatasource>()
        .getNotificationsByUser(userId);
  }
}
