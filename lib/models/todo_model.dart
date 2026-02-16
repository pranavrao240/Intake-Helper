import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/models/nutrition_model.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
abstract class TodoResponse with _$TodoResponse {
  const factory TodoResponse({
    required String message,
    required TodoModel? data,
  }) = _TodoResponse;

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);
}

@freezed
abstract class TodoModel with _$TodoModel {
  const factory TodoModel({
    String? userId,
    String? mealId,
    @Default([]) List<Meal> meals,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

@freezed
abstract class Meal with _$Meal {
  const factory Meal({
    @JsonKey(
      name: '_id',
    )
    required String id,
    required Nutrition nutrition,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
