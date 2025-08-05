import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intake_helper/models/nutrition_model.dart';
part 'singlenutrition_model.freezed.dart';
part 'singlenutrition_model.g.dart';

@freezed
abstract class SingleNutritionResponse with _$SingleNutritionResponse {
  const factory SingleNutritionResponse({
    required String message,
    required Nutrition data,
  }) = _SingleNutritionResponse;

  factory SingleNutritionResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleNutritionResponseFromJson(json);
}
