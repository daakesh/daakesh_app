import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../src.export.dart';

abstract class NotificationsUseCases {
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(String userId);
}

@LazySingleton(as: NotificationsUseCases)
class NotificationsUseCasesImpl implements NotificationsUseCases {
  @override
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(
      String userId) async {
    return await getIt
        .get<NotificationsRepository>()
        .getNotificationsByUser(userId);
  }
}
