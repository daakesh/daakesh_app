class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final NotificationType type;
  final String? itemType; // Add this field to store "Sell" or "Swap"
  final String? imageUrl; // Add this field to store the first item image
  final Map<String, dynamic>? itemData; // Store the original item json
  final int? offerId; // Add this field to store offerID

  const NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    required this.type,
    this.itemType,
    this.imageUrl,
    this.itemData,
    this.offerId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    final item = json['item'] as Map<String, dynamic>?;
    final comment = json['comment'] as Map<String, dynamic>?;
    final from = json['from'] as Map<String, dynamic>?;

    // Determine notification type based on item type and notification type
    final notificationType = json['notification_type']?.toString() ?? 'system';
    final itemType = item?['Type']?.toString().toLowerCase();

    return NotificationModel(
      id: json['id']?.toString() ?? '',
      title: _buildTitle(json, item, notificationType),
      message: _buildMessage(json, item, comment, from),
      timestamp: _parseTimestamp(json['created_at']?.toString()),
      isRead:
          json['seen'] == 1 || json['isRead'] == true || json['read'] == true,
      type: _parseNotificationType(notificationType, itemType),
      itemType: item?['Type']?.toString(),
      imageUrl: _extractFirstImage(item),
      itemData: item, // Store the full item json
      offerId: json['offerID'] != null
          ? int.tryParse(json['offerID'].toString())
          : null,
    );
  }

  static String _buildTitle(Map<String, dynamic> json,
      Map<String, dynamic>? item, String notificationType) {
    if (json['title'] != null && json['title'].toString().isNotEmpty) {
      return json['title'].toString();
    }

    if (item?['Title'] != null && item!['Title'].toString().isNotEmpty) {
      return item['Title'].toString();
    }

    // Generate contextual title based on notification type
    switch (notificationType.toLowerCase()) {
      case 'comment':
        return 'New Comment';
      case 'order':
        return 'Order Update';
      case 'swap':
        return 'Swap Request';
      case 'promotion':
        return 'Special Promotion';
      default:
        return 'New Notification';
    }
  }

  static String _buildMessage(
      Map<String, dynamic> json,
      Map<String, dynamic>? item,
      Map<String, dynamic>? comment,
      Map<String, dynamic>? from) {
    // Use explicit message/body first
    if (json['body'] != null && json['body'].toString().isNotEmpty) {
      return json['body'].toString();
    }

    if (json['message'] != null && json['message'].toString().isNotEmpty) {
      return json['message'].toString();
    }

    // Use comment description if available
    if (comment?['commentDesc'] != null &&
        comment!['commentDesc'].toString().isNotEmpty) {
      final commenterName = from?['name']?.toString() ?? 'Someone';
      return '$commenterName commented: "${comment['commentDesc']}"';
    }

    // Use item description if available
    if (item?['description'] != null &&
        item!['description'].toString().isNotEmpty) {
      return item['description'].toString();
    }

    // Generate contextual message
    final notificationType =
        json['notification_type']?.toString() ?? 'notification';
    final itemTitle = item?['Title']?.toString() ?? 'item';

    switch (notificationType.toLowerCase()) {
      case 'comment':
        return 'You received a new comment on "$itemTitle"';
      case 'order':
        return 'Your order for "$itemTitle" has been updated';
      case 'swap':
        return 'New swap request for "$itemTitle"';
      case 'promotion':
        return 'Special offer available for "$itemTitle"';
      default:
        return 'You have a new notification about "$itemTitle"';
    }
  }

  static DateTime _parseTimestamp(String? timestampStr) {
    if (timestampStr == null || timestampStr.isEmpty) {
      return DateTime.now();
    }

    // Handle the malformed timestamp format from API
    // Convert "2025-05-02T20":"35":01.000000Z" to "2025-05-02T20:35:01.000000Z"
    String cleanTimestamp =
        timestampStr.replaceAll('":', ':').replaceAll('":"', ':');

    try {
      return DateTime.parse(cleanTimestamp);
    } catch (e) {
      // Fallback parsing attempts
      try {
        return DateTime.tryParse(timestampStr) ?? DateTime.now();
      } catch (e) {
        return DateTime.now();
      }
    }
  }

  static NotificationType _parseNotificationType(
      String type, String? itemType) {
    switch (type.toLowerCase()) {
      case 'comment':
        return NotificationType.comment;
      case 'order':
        return NotificationType.order;
      case 'swap':
        return NotificationType.swap;
      case 'promotion':
      case 'promo':
        return NotificationType.promotion;
      case 'offer':
        return NotificationType.offer; // Add this
      default:
        // If notification type is not clear, use item type to infer
        if (itemType != null) {
          switch (itemType.toLowerCase()) {
            case 'swap':
              return NotificationType.swap;
            case 'sell':
              return NotificationType.order;
            default:
              return NotificationType.system;
          }
        }
        return NotificationType.system;
    }
  }

  static String? _extractFirstImage(Map<String, dynamic>? item) {
    if (item == null) return null;

    final itemImg = item['itemImg'];
    if (itemImg is List && itemImg.isNotEmpty) {
      return itemImg.first?.toString();
    }

    return null;
  }

  // Add a helper to get itemId for navigation
  int? get itemId {
    try {
      final item = (this as dynamic)._rawItem;
      if (item != null && item['id'] != null) {
        return int.tryParse(item['id'].toString());
      }
    } catch (_) {}
    return null;
  }

  // Helper to expose the item JSON for navigation
  Map<String, dynamic>? get itemJson => itemData;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'type': type.name,
      'itemType': itemType,
      'imageUrl': imageUrl,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? timestamp,
    bool? isRead,
    NotificationType? type,
    String? itemType,
    String? imageUrl,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      itemType: itemType ?? this.itemType,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

enum NotificationType {
  order,
  swap,
  system,
  promotion,
  comment,
  offer, // Add this
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case NotificationType.order:
        return 'Order';
      case NotificationType.swap:
        return 'Swap';
      case NotificationType.system:
        return 'System';
      case NotificationType.promotion:
        return 'Promotion';
      case NotificationType.comment:
        return 'Comment';
      case NotificationType.offer: // Add this
        return 'Offer';
    }
  }
}
