import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_model.freezed.dart';
part 'streak_model.g.dart';

@freezed
abstract class StreakModel with _$StreakModel {
  const factory StreakModel({
    required bool success,
    required String message,
    required StreakData data,
  }) = _StreakModel;

  factory StreakModel.fromJson(Map<String, dynamic> json) =>
      _$StreakModelFromJson(json);
}

@freezed
abstract class StreakData with _$StreakData {
  const factory StreakData({
    required int currentStreak,
    required int longestStreak,
    required DateTime lastCompletedDate,
    required List<StreakHistory> streakHistory,
  }) = _StreakData;

  factory StreakData.fromJson(Map<String, dynamic> json) =>
      _$StreakDataFromJson(json);
}

@freezed
abstract class StreakHistory with _$StreakHistory {
  const factory StreakHistory({
    required DateTime date,
    required int todosCompleted,
    required int todosAdded,
    required bool streakMaintained,
    @JsonKey(name: "_id") required String id,
  }) = _StreakHistory;

  factory StreakHistory.fromJson(Map<String, dynamic> json) =>
      _$StreakHistoryFromJson(json);
}
