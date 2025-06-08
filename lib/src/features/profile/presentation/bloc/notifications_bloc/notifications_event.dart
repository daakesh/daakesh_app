import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationsEvent extends NotificationsEvent {
  const GetNotificationsEvent();
}

class MarkNotificationAsReadEvent extends NotificationsEvent {
  final String notificationId;

  const MarkNotificationAsReadEvent({required this.notificationId});

  @override
  List<Object> get props => [notificationId];
}

class MarkAllNotificationsAsReadEvent extends NotificationsEvent {
  const MarkAllNotificationsAsReadEvent();
}

class ClearNotificationsEvent extends NotificationsEvent {
  const ClearNotificationsEvent();
}
