import 'package:dartz/dartz.dart';
import '../../../../src.export.dart';

abstract class NotificationsDatasource {
  Future<Either<Failure, ValidResponse>> getNotificationsByUser(String userId);
}
