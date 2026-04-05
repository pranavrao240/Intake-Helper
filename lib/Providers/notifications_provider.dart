import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/notification_model.dart';

class NotificationsState {
  final List<NotificationModel> notifications;
  final bool isLoading;

  const NotificationsState({
    required this.notifications,
    this.isLoading = false,
  });

  int get unreadCount => notifications.where((n) => n.unread).length;

  NotificationsState copyWith({
    List<NotificationModel>? notifications,
    bool? isLoading,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  NotificationsNotifier() : super(const NotificationsState(notifications: [])) {
    _loadNotifications();
  }

  void _loadNotifications() {
    state = state.copyWith(isLoading: true);

    final data = [
      NotificationModel(
        id: 1,
        type: NotificationType.reminder,
        icon: Icons.notifications_rounded,
        title: 'Dinner Reminder',
        message: 'Time for your scheduled dinner at 8:00 PM',
        time: '5 min ago',
        unread: true,
        gradientColors: [const Color(0xFFEF4444), const Color(0xFFF97316)],
        bgGradientColors: [const Color(0xFFFEF2F2), const Color(0xFFFFF7ED)],
      ),
      NotificationModel(
        id: 2,
        type: NotificationType.achievement,
        icon: Icons.emoji_events_rounded,
        title: '7 Day Streak! 🔥',
        message: "Congratulations! You've logged meals for 7 consecutive days",
        time: '2 hours ago',
        unread: true,
        gradientColors: [const Color(0xFFEAB308), const Color(0xFFD97706)],
        bgGradientColors: [const Color(0xFFFEFCE8), const Color(0xFFFFFBEB)],
      ),
      NotificationModel(
        id: 3,
        type: NotificationType.goal,
        icon: Icons.track_changes_rounded,
        title: 'Protein Goal Reached',
        message: 'You hit 80% of your daily protein target. Great work!',
        time: '4 hours ago',
        unread: true,
        gradientColors: [const Color(0xFF22C55E), const Color(0xFF059669)],
        bgGradientColors: [const Color(0xFFF0FDF4), const Color(0xFFECFDF5)],
      ),
      NotificationModel(
        id: 4,
        type: NotificationType.insight,
        icon: Icons.trending_up_rounded,
        title: 'Weekly Progress',
        message: 'Your protein intake is up 12% from last week',
        time: '1 day ago',
        unread: false,
        gradientColors: [const Color(0xFF3B82F6), const Color(0xFF4F46E5)],
        bgGradientColors: [const Color(0xFFEFF6FF), const Color(0xFFEEF2FF)],
      ),
      NotificationModel(
        id: 5,
        type: NotificationType.completed,
        icon: Icons.check_circle_rounded,
        title: 'All Meals Logged',
        message: "You've logged all 3 meals for today. Keep it up!",
        time: '1 day ago',
        unread: false,
        gradientColors: [const Color(0xFF22C55E), const Color(0xFF0D9488)],
        bgGradientColors: [const Color(0xFFF0FDF4), const Color(0xFFF0FDFA)],
      ),
      NotificationModel(
        id: 6,
        type: NotificationType.favorite,
        icon: Icons.favorite_rounded,
        title: 'New Saved Meal',
        message: 'Grilled Chicken Bowl was added to your favorites',
        time: '2 days ago',
        unread: false,
        gradientColors: [const Color(0xFFEC4899), const Color(0xFFF43F5E)],
        bgGradientColors: [const Color(0xFFFDF2F8), const Color(0xFFFFF1F2)],
      ),
      NotificationModel(
        id: 7,
        type: NotificationType.reminder,
        icon: Icons.notifications_rounded,
        title: 'Breakfast Time',
        message: "Good morning! Don't forget to log your breakfast",
        time: '3 days ago',
        unread: false,
        gradientColors: [const Color(0xFFA855F7), const Color(0xFF7C3AED)],
        bgGradientColors: [const Color(0xFFFAF5FF), const Color(0xFFF5F3FF)],
      ),
    ];

    state = state.copyWith(notifications: data, isLoading: false);
  }

  void markAllRead() {
    final updated =
        state.notifications.map((n) => n.copyWith(unread: false)).toList();
    state = state.copyWith(notifications: updated);
  }

  void markRead(int id) {
    final updated = state.notifications
        .map((n) => n.id == id ? n.copyWith(unread: false) : n)
        .toList();
    state = state.copyWith(notifications: updated);
  }

  void dismissNotification(int id) {
    final updated = state.notifications.where((n) => n.id != id).toList();
    state = state.copyWith(notifications: updated);
  }
}

// ---------------------------------------------------------------------------
// Providers
// ---------------------------------------------------------------------------

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, NotificationsState>(
  (ref) => NotificationsNotifier(),
);

// ---------------------------------------------------------------------------
// Notification Settings State
// ---------------------------------------------------------------------------

class NotificationSetting {
  final String label;
  final bool enabled;

  const NotificationSetting({required this.label, required this.enabled});

  NotificationSetting copyWith({bool? enabled}) =>
      NotificationSetting(label: label, enabled: enabled ?? this.enabled);
}

class NotificationSettingsNotifier
    extends StateNotifier<List<NotificationSetting>> {
  NotificationSettingsNotifier()
      : super([
          const NotificationSetting(label: 'Meal Reminders', enabled: true),
          const NotificationSetting(label: 'Goal Achievements', enabled: true),
          const NotificationSetting(label: 'Weekly Summaries', enabled: true),
          const NotificationSetting(label: 'Streak Alerts', enabled: false),
        ]);

  void toggle(int index) {
    final updated = [...state];
    updated[index] = updated[index].copyWith(enabled: !updated[index].enabled);
    state = updated;
  }
}

final notificationSettingsProvider = StateNotifierProvider<
    NotificationSettingsNotifier, List<NotificationSetting>>(
  (ref) => NotificationSettingsNotifier(),
);
