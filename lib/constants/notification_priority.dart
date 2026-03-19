enum NotificationPriority {
  low,
  medium,
  high,
  urgent;

  String get name {
    switch (this) {
      case NotificationPriority.low:
        return 'low';
      case NotificationPriority.medium:
        return 'medium';
      case NotificationPriority.high:
        return 'high';
      case NotificationPriority.urgent:
        return 'urgent';
    }
  }
}
