import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_notification_model.freezed.dart';
part 'meal_notification_model.g.dart';

enum NotificationType {
  @JsonValue('streak_milestone')
  streakMilestone,
  @JsonValue('streak_warning')
  streakWarning,
  @JsonValue('streak_lost')
  streakLost,
  @JsonValue('meal_reminder')
  mealReminder,
  @JsonValue('nutrition_goal')
  nutritionGoal,
  @JsonValue('profile_update')
  profileUpdate,
  @JsonValue('system')
  system,
  @JsonValue('todo_reminder')
  todoReminder,
  @JsonValue('achievement')
  achievement,
}

enum NotificationPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

@freezed
abstract class MealNotificationModel with _$MealNotificationModel {
  const factory MealNotificationModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'type')
    @Default(NotificationType.system)
    NotificationType type,
    @JsonKey(name: 'priority')
    @Default(NotificationPriority.medium)
    NotificationPriority priority,
    @JsonKey(name: 'isRead') @Default(false) bool isRead,
    @JsonKey(name: 'actionUrl') String? actionUrl,
    @JsonKey(name: 'actionText') String? actionText,
    @JsonKey(name: 'metadata') @Default({}) Map<String, dynamic> metadata,
    @JsonKey(name: 'expiresAt') DateTime? expiresAt,
    @JsonKey(name: 'scheduledFor') DateTime? scheduledFor,
    @JsonKey(name: 'sentAt') DateTime? sentAt,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _MealNotificationModel;

  factory MealNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$MealNotificationModelFromJson(json);
}
