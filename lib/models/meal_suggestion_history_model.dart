import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_suggestion_history_model.freezed.dart';
part 'meal_suggestion_history_model.g.dart';

@freezed
abstract class MealSuggestionHistoryModel with _$MealSuggestionHistoryModel {
  const factory MealSuggestionHistoryModel({
    required String id,
    required String userId,
    required String prompt,
    required dynamic response,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MealSuggestionHistoryModel;

  factory MealSuggestionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MealSuggestionHistoryModelFromJson(json);
}
