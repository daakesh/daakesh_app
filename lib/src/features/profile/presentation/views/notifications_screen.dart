import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src.export.dart';

enum NotificationFilterType {
  swap,
  sell,
}

extension NotificationFilterTypeExtension on NotificationFilterType {
  String get displayName {
    switch (this) {
      case NotificationFilterType.swap:
        return 'Swap';
      case NotificationFilterType.sell:
        return 'Sell';
    }
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationFilterType _currentFilter = NotificationFilterType.sell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<NotificationsBloc>().add(const GetNotificationsEvent());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(withArrowBack: true),
            const SizedBox(height: 21.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: context.easyTheme.textTheme.headlineMedium!
                        .copyWith(fontSize: 24.0),
                  ),
                  BlocBuilder<NotificationsBloc, NotificationsState>(
                    builder: (context, state) {
                      if (state.unreadCount > 0) {
                        return TextButton(
                          onPressed: () {
                            context.read<NotificationsBloc>().add(
                                  const MarkAllNotificationsAsReadEvent(),
                                );
                          },
                          child: Text(
                            'Mark All Read',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(color: ColorName.blueGray),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // Filter Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: _buildFilterTabs(),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: BlocBuilder<NotificationsBloc, NotificationsState>(
                builder: (context, state) {
                  if (state.notificationsStateStatus.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorName.blueGray,
                      ),
                    );
                  }

                  if (state.notificationsStateStatus.isError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 64,
                            color: ColorName.grayishBlue,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load notifications',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(color: ColorName.grayishBlue),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<NotificationsBloc>().add(
                                    const GetNotificationsEvent(),
                                  );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  final filteredNotifications =
                      _getFilteredNotifications(state.notifications);

                  if (filteredNotifications.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svg.commentIcon.svg(
                            width: 64,
                            height: 64,
                            color: ColorName.grayishBlue,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No ${_currentFilter.displayName.toLowerCase()} notifications yet',
                            style: context.easyTheme.textTheme.headlineMedium!
                                .copyWith(
                              fontSize: 18,
                              color: ColorName.grayishBlue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'When you have ${_currentFilter.displayName.toLowerCase()} notifications, they will appear here',
                            style: context.easyTheme.textTheme.bodyMedium!
                                .copyWith(color: ColorName.grayishBlue),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    itemCount: filteredNotifications.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final notification = filteredNotifications[index];
                      return NotificationItemWidget(
                        notification: notification,
                        onTap: () {
                          if (!notification.isRead) {
                            context.read<NotificationsBloc>().add(
                                  MarkNotificationAsReadEvent(
                                    notificationId: notification.id,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: ColorName.paleGray,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          // SELL
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentFilter = NotificationFilterType.sell;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _currentFilter == NotificationFilterType.sell
                      ? ColorName.amber
                      : ColorName.paleGray,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'Sell',
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      color: _currentFilter == NotificationFilterType.sell
                          ? ColorName.white
                          : ColorName.blueGray,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SWAP
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentFilter = NotificationFilterType.swap;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _currentFilter == NotificationFilterType.swap
                      ? ColorName.amber
                      : ColorName.paleGray,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'Swap',
                    style: context.easyTheme.textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      color: _currentFilter == NotificationFilterType.swap
                          ? ColorName.white
                          : ColorName.blueGray,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<NotificationModel> _getFilteredNotifications(
      List<NotificationModel> notifications) {
    return notifications.where((notification) {
      switch (_currentFilter) {
        case NotificationFilterType.sell:
          // Show notifications where itemType is "Sell"
          // OR itemType is null/empty (for backward compatibility with static data)
          // OR it's a sell-related notification type
          return notification.itemType?.toLowerCase() == 'sell' ||
              (notification.itemType == null &&
                  (notification.type == NotificationType.order ||
                      notification.type == NotificationType.system ||
                      notification.type == NotificationType.promotion));
        case NotificationFilterType.swap:
          // Show notifications where itemType is "Swap"
          // OR itemType is null/empty and it's a swap-related notification type
          return notification.itemType?.toLowerCase() == 'swap' ||
              (notification.itemType == null &&
                  (notification.type == NotificationType.swap ||
                      notification.type == NotificationType.comment));
      }
    }).toList();
  }
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Custom navigation for comment notifications
        if (notification.type == NotificationType.comment) {
          // Use itemJson if available, fallback to itemId
          if (notification.itemJson != null) {
            Utils.openNavNewPage(
              context,
              MoreInfoProductScreen(
                todayDealItem: TodayItem.fromJson(notification.itemJson!),
                isDaakeshTodayDeal: true,
              ),
            );
            return;
          } else if (notification.itemId != null) {
            Utils.openNavNewPage(
              context,
              MoreInfoProductScreen(
                todayDealItem: TodayItem(id: notification.itemId),
                isDaakeshTodayDeal: true,
              ),
            );
            return;
          }
        }
        // Custom navigation for offer notifications
        if (notification.type == NotificationType.offer &&
            notification.offerId != null) {
          // Navigate to MyOrderScreen (receive tab) for offer notifications
          Utils.openNavNewPage(
            context,
            MyOrderScreen(externalContext: context),
          );
          return;
        }
        onTap();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.transparent
              : ColorName.blueGray.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorName.gray.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: notification.isRead
              ? null
              : [
                  BoxShadow(
                    color: ColorName.blueGray.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Image (if available)
            if (notification.imageUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  notification.imageUrl!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _getNotificationTypeColor(notification.type)
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getNotificationTypeIcon(notification.type),
                        size: 24,
                        color: _getNotificationTypeColor(notification.type),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ColorName.paleGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ColorName.blueGray,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
            ] else
              // Fallback icon if no image
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getNotificationTypeColor(notification.type)
                      .withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getNotificationTypeIcon(notification.type),
                  size: 24,
                  color: _getNotificationTypeColor(notification.type),
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              style: context.easyTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontWeight: notification.isRead
                                    ? FontWeight.w500
                                    : FontWeight.w700,
                                fontSize: 16,
                                color: ColorName.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _getNotificationTypeColor(notification.type)
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                notification.type.displayName,
                                style: context.easyTheme.textTheme.bodySmall!
                                    .copyWith(
                                  color: _getNotificationTypeColor(
                                      notification.type),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (!notification.isRead)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: ColorName.blueGray,
                                shape: BoxShape.circle,
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTimestamp(notification.timestamp),
                            style:
                                context.easyTheme.textTheme.bodySmall!.copyWith(
                              color: ColorName.grayishBlue,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.message,
                    style: context.easyTheme.textTheme.bodyMedium!.copyWith(
                      color: notification.isRead
                          ? ColorName.grayishBlue
                          : ColorName.charcoalGray,
                      fontSize: 14,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getNotificationTypeColor(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Colors.green;
      case NotificationType.swap:
        return Colors.blue;
      case NotificationType.system:
        return Colors.orange;
      case NotificationType.promotion:
        return Colors.purple;
      case NotificationType.comment:
        return Colors.indigo;
      case NotificationType.offer:
        return Colors.teal;
    }
  }

  IconData _getNotificationTypeIcon(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Icons.shopping_bag_outlined;
      case NotificationType.swap:
        return Icons.swap_horiz;
      case NotificationType.system:
        return Icons.info_outline;
      case NotificationType.promotion:
        return Icons.local_offer_outlined;
      case NotificationType.comment:
        return Icons.comment_outlined;
      case NotificationType.offer:
        return Icons.local_offer;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}
