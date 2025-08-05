import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/models/nutrition_model.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  factory TodoModel({
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'mealId') String? mealId,
    @Default([]) List<Meal> meals,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

@freezed
abstract class Meal with _$Meal {
  factory Meal({
    @JsonKey(name: '_id') String? id,
    required Nutrition nutrition,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
