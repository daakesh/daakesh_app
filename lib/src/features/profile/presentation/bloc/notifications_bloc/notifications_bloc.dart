import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../src.export.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<GetNotificationsEvent>(_getNotifications);
    on<MarkNotificationAsReadEvent>(_markNotificationAsRead);
    on<MarkAllNotificationsAsReadEvent>(_markAllNotificationsAsRead);
    on<ClearNotificationsEvent>(_clearNotifications);

    // Load notifications when bloc is created
    add(const GetNotificationsEvent());
  }

  static NotificationsBloc get get => BlocProvider.of(Utils.currentContext);

  FutureOr<void> _getNotifications(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) async {
    print('🔔 Getting notifications with fixed API endpoint...');
    emit(state.copyWith(
        notificationsStateStatus: NotificationsStateStatus.LOADING));

    try {
      // Get user ID from ValueConstants (always current user)
      final userId = ValueConstants.userId;
      if (userId.isEmpty) {
        emit(state.copyWith(
          notificationsStateStatus: NotificationsStateStatus.SUCCESS,
          notifications: [],
          unreadCount: 0,
        ));
        return;
      }
      final result = await getIt
          .get<NotificationsUseCases>()
          .getNotificationsByUser(userId);

      await result.fold(
        (failure) async {
          ShowToastSnackBar.showErrorDialog(
            message: 'Failed to load notifications: ${failure.message}',
            title: 'Network Error',
          );
          // Do NOT fallback to static data, just show empty
          emit(state.copyWith(
            notificationsStateStatus: NotificationsStateStatus.SUCCESS,
            notifications: [],
            unreadCount: 0,
          ));
        },
        (response) async {
          if (response.status == true && response.data != null) {
            final List<dynamic> notificationsData = response.data is List
                ? response.data
                : (response.data is Map
                    ? (response.data as Map)['data'] ?? []
                    : []);

            final notifications = notificationsData
                .map((json) {
                  try {
                    return NotificationModel.fromJson(
                        json as Map<String, dynamic>);
                  } catch (e) {
                    print('⚠️ Error parsing notification: $e');
                    print('📄 JSON data: $json');
                    return null;
                  }
                })
                .where((notification) => notification != null)
                .cast<NotificationModel>()
                .toList();

            final unreadCount = notifications
                .where((notification) => !notification.isRead)
                .length;

            emit(state.copyWith(
              notificationsStateStatus: NotificationsStateStatus.SUCCESS,
              notifications: notifications,
              unreadCount: unreadCount,
            ));
          } else {
            emit(state.copyWith(
              notificationsStateStatus: NotificationsStateStatus.SUCCESS,
              notifications: [],
              unreadCount: 0,
            ));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(
        notificationsStateStatus: NotificationsStateStatus.SUCCESS,
        notifications: [],
        unreadCount: 0,
      ));
    }
  }

  FutureOr<void> _markNotificationAsRead(MarkNotificationAsReadEvent event,
      Emitter<NotificationsState> emit) async {
    // Update local state only since API doesn't support mark as read
    _updateNotificationLocally(event.notificationId, emit);
  }

  void _updateNotificationLocally(
      String notificationId, Emitter<NotificationsState> emit) {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();

    final unreadCount = updatedNotifications
        .where((notification) => !notification.isRead)
        .length;

    emit(state.copyWith(
      notifications: updatedNotifications,
      unreadCount: unreadCount,
    ));
  }

  FutureOr<void> _markAllNotificationsAsRead(
      MarkAllNotificationsAsReadEvent event,
      Emitter<NotificationsState> emit) async {
    // Update local state only since API doesn't support mark all as read
    _markAllNotificationsReadLocally(emit);
  }

  void _markAllNotificationsReadLocally(Emitter<NotificationsState> emit) {
    final updatedNotifications = state.notifications.map((notification) {
      return notification.copyWith(isRead: true);
    }).toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      unreadCount: 0,
    ));
  }

  FutureOr<void> _clearNotifications(
      ClearNotificationsEvent event, Emitter<NotificationsState> emit) async {
    emit(state.copyWith(
      notifications: [],
      unreadCount: 0,
    ));
  }
}
