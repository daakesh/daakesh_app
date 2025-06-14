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
      // Get user ID - replace with actual user ID retrieval
      const userId = 'f55e135d-188e-47c7-8a69-38afa51813ce';

      final result = await getIt
          .get<NotificationsUseCases>()
          .getNotificationsByUser(userId);

      await result.fold(
        (failure) async {
          // Show error dialog for API failures
          ShowToastSnackBar.showErrorDialog(
            message: 'Failed to load notifications: ${failure.message}',
            title: 'Network Error',
          );

          // If API fails, fallback to static data for now
          final staticNotifications = _generateStaticNotifications();
          final unreadCount = staticNotifications
              .where((notification) => !notification.isRead)
              .length;

          emit(state.copyWith(
            notificationsStateStatus: NotificationsStateStatus.SUCCESS,
            notifications: staticNotifications,
            unreadCount: unreadCount,
          ));
        },
        (response) async {
          if (response.status == true && response.data != null) {
            // The API returns data as a list directly
            final List<dynamic> notificationsData = response.data is List
                ? response.data
                : (response.data is Map
                    ? (response.data as Map)['data'] ?? []
                    : []);

            print(
                '🔔 Parsing ${notificationsData.length} notifications from API...');

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

            print(
                '✅ Successfully parsed ${notifications.length} notifications');

            final unreadCount = notifications
                .where((notification) => !notification.isRead)
                .length;

            emit(state.copyWith(
              notificationsStateStatus: NotificationsStateStatus.SUCCESS,
              notifications: notifications,
              unreadCount: unreadCount,
            ));
          } else {
            print('⚠️ API response unsuccessful, using static data');
            // Fallback to static data if API response is not successful
            final staticNotifications = _generateStaticNotifications();
            final unreadCount = staticNotifications
                .where((notification) => !notification.isRead)
                .length;

            emit(state.copyWith(
              notificationsStateStatus: NotificationsStateStatus.SUCCESS,
              notifications: staticNotifications,
              unreadCount: unreadCount,
            ));
          }
        },
      );
    } catch (e) {
      // Fallback to static data in case of any error
      final staticNotifications = _generateStaticNotifications();
      final unreadCount = staticNotifications
          .where((notification) => !notification.isRead)
          .length;

      emit(state.copyWith(
        notificationsStateStatus: NotificationsStateStatus.SUCCESS,
        notifications: staticNotifications,
        unreadCount: unreadCount,
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

  List<NotificationModel> _generateStaticNotifications() {
    return [
      // SELL/ORDER related notifications
      NotificationModel(
        id: '1',
        title: 'Order Confirmed',
        message:
            'Your order #DK12345 has been confirmed and is being processed. Expected delivery in 2-3 business days.',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
        type: NotificationType.order,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '2',
        title: 'Order Shipped',
        message:
            'Great news! Your order #DK12340 has been shipped via DHL. Track your package with code: DHL123456789.',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        isRead: false,
        type: NotificationType.order,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),
      NotificationModel(
        id: '3',
        title: 'Payment Successful',
        message:
            'Your payment of 250 AED for order #DK12338 has been processed successfully.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        type: NotificationType.order,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '4',
        title: 'Special Promotion',
        message:
            'Flash Sale Alert! Get up to 30% off on electronics and gadgets. Limited time offer ends tonight!',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
        isRead: true,
        type: NotificationType.promotion,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '5',
        title: 'Weekend Sale',
        message:
            'Exclusive weekend deals on home appliances. Save up to 40% on selected items. Shop now!',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: false,
        type: NotificationType.promotion,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),

      // SWAP related notifications
      NotificationModel(
        id: '6',
        title: 'New Swap Request',
        message:
            'Ahmed Al-Rashid wants to swap his iPhone 14 Pro Max (256GB) with your MacBook Air M2. Tap to view details.',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        isRead: false,
        type: NotificationType.swap,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '7',
        title: 'Swap Request Accepted',
        message:
            'Congratulations! Sarah Hassan has accepted your swap request for her Canon EOS R5 camera.',
        timestamp: DateTime.now().subtract(const Duration(hours: 12)),
        isRead: false,
        type: NotificationType.swap,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),
      NotificationModel(
        id: '8',
        title: 'Swap Completed',
        message:
            'Your swap with Mohammad Abdullah has been completed successfully. Don\'t forget to rate your experience!',
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 6)),
        isRead: true,
        type: NotificationType.swap,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '9',
        title: 'Swap Offer Declined',
        message:
            'Unfortunately, your swap offer for the PlayStation 5 has been declined. Keep trying with other items!',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        isRead: true,
        type: NotificationType.swap,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),

      // COMMENT related notifications (categorized under swap)
      NotificationModel(
        id: '10',
        title: 'New Comment on Your Item',
        message:
            'Fatima Al-Zahra commented on your "Gaming Setup Bundle": "Is this still available for swap?"',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        isRead: false,
        type: NotificationType.comment,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '11',
        title: 'Comment Reply',
        message:
            'Omar Khalil replied to your comment on "Vintage Watch Collection": "Thanks for the detailed info!"',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        isRead: false,
        type: NotificationType.comment,
        itemType: 'Swap',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),
      NotificationModel(
        id: '12',
        title: 'Item Question',
        message:
            'Ali Hassan asked about your "Professional Camera Kit": "What\'s the condition and are all accessories included?"',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
        type: NotificationType.comment,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),

      // SYSTEM notifications (categorized under sell)
      NotificationModel(
        id: '13',
        title: 'App Update Available',
        message:
            'New version 2.1.0 is available with improved performance and exciting new features. Update now!',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        isRead: true,
        type: NotificationType.system,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),
      NotificationModel(
        id: '14',
        title: 'Account Security',
        message:
            'For your security, we recommend enabling two-factor authentication on your account.',
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        isRead: false,
        type: NotificationType.system,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_raucoUzarYdHBq70rNv1.png',
      ),
      NotificationModel(
        id: '15',
        title: 'New Feature: Voice Search',
        message:
            'Try our new voice search feature! Simply tap the microphone icon and speak your search query.',
        timestamp: DateTime.now().subtract(const Duration(days: 7)),
        isRead: true,
        type: NotificationType.system,
        itemType: 'Sell',
        imageUrl:
            'https://daakesh.com/Images/Items/item_I89wByqTGWO6cojj8Wop.png',
      ),
    ];
  }
}
