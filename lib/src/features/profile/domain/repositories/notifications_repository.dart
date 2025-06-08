import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(String userId);
}
