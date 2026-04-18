// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StreakModel _$StreakModelFromJson(Map<String, dynamic> json) => _StreakModel(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: StreakData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StreakModelToJson(_StreakModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_StreakData _$StreakDataFromJson(Map<String, dynamic> json) => _StreakData(
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      lastCompletedDate: json['lastCompletedDate'] == null
          ? null
          : DateTime.parse(json['lastCompletedDate'] as String),
      streakHistory: (json['streakHistory'] as List<dynamic>)
          .map((e) => StreakHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StreakDataToJson(_StreakData instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastCompletedDate': instance.lastCompletedDate?.toIso8601String(),
      'streakHistory': instance.streakHistory,
    };

_StreakHistory _$StreakHistoryFromJson(Map<String, dynamic> json) =>
    _StreakHistory(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      todosCompleted: (json['todosCompleted'] as num).toInt(),
      todosAdded: (json['todosAdded'] as num).toInt(),
      streakMaintained: json['streakMaintained'] as bool? ?? false,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$StreakHistoryToJson(_StreakHistory instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'todosCompleted': instance.todosCompleted,
      'todosAdded': instance.todosAdded,
      'streakMaintained': instance.streakMaintained,
      '_id': instance.id,
    };
