// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealNotificationModel _$MealNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _MealNotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.system,
      priority: $enumDecodeNullable(
              _$NotificationPriorityEnumMap, json['priority']) ??
          NotificationPriority.medium,
      isRead: json['isRead'] as bool? ?? false,
      actionUrl: json['actionUrl'] as String?,
      actionText: json['actionText'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      scheduledFor: json['scheduledFor'] == null
          ? null
          : DateTime.parse(json['scheduledFor'] as String),
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MealNotificationModelToJson(
        _MealNotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'isRead': instance.isRead,
      'actionUrl': instance.actionUrl,
      'actionText': instance.actionText,
      'metadata': instance.metadata,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'scheduledFor': instance.scheduledFor?.toIso8601String(),
      'sentAt': instance.sentAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.streakMilestone: 'streak_milestone',
  NotificationType.streakWarning: 'streak_warning',
  NotificationType.streakLost: 'streak_lost',
  NotificationType.mealReminder: 'meal_reminder',
  NotificationType.nutritionGoal: 'nutrition_goal',
  NotificationType.profileUpdate: 'profile_update',
  NotificationType.system: 'system',
  NotificationType.todoReminder: 'todo_reminder',
  NotificationType.achievement: 'achievement',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.medium: 'medium',
  NotificationPriority.high: 'high',
  NotificationPriority.urgent: 'urgent',
};
