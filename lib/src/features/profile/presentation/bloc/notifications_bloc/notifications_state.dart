import 'package:equatable/equatable.dart';
import '../../../data/models/notification_model.dart';

enum NotificationsStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

extension NotificationsStateStatusX on NotificationsStateStatus {
  bool get isInitial => this == NotificationsStateStatus.INITIAL;
  bool get isSuccess => this == NotificationsStateStatus.SUCCESS;
  bool get isError => this == NotificationsStateStatus.ERROR;
  bool get isLoading => this == NotificationsStateStatus.LOADING;
}

class NotificationsState extends Equatable {
  final NotificationsStateStatus notificationsStateStatus;
  final List<NotificationModel> notifications;
  final int unreadCount;

  const NotificationsState({
    this.notificationsStateStatus = NotificationsStateStatus.INITIAL,
    this.notifications = const [],
    this.unreadCount = 0,
  });

  NotificationsState copyWith({
    NotificationsStateStatus? notificationsStateStatus,
    List<NotificationModel>? notifications,
    int? unreadCount,
  }) {
    return NotificationsState(
      notificationsStateStatus:
          notificationsStateStatus ?? this.notificationsStateStatus,
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  List<Object?> get props => [
        notificationsStateStatus,
        notifications,
        unreadCount,
      ];
}
