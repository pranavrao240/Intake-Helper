import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_model.freezed.dart';
part 'streak_model.g.dart';

@freezed
abstract class StreakModel with _$StreakModel {
  const factory StreakModel({
    required bool success,
    String? message,
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
    DateTime? lastCompletedDate,
    required List<StreakHistory> streakHistory,
  }) = _StreakData;

  factory StreakData.fromJson(Map<String, dynamic> json) =>
      _$StreakDataFromJson(json);
}

@freezed
abstract class StreakHistory with _$StreakHistory {
  const factory StreakHistory({
    DateTime? date,
    required int todosCompleted,
    required int todosAdded,
    @Default(false) bool streakMaintained,
    @JsonKey(name: "_id") String? id,
  }) = _StreakHistory;

  factory StreakHistory.fromJson(Map<String, dynamic> json) =>
      _$StreakHistoryFromJson(json);
}
