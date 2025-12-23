import 'package:freezed_annotation/freezed_annotation.dart';
part 'nutrition_model.freezed.dart';
part 'nutrition_model.g.dart';

@freezed
abstract class NutritionResponse with _$NutritionResponse {
  const factory NutritionResponse({
    required String message,
    required List<Nutrition> data,
  }) = _NutritionResponse;

  factory NutritionResponse.fromJson(Map<String, dynamic> json) =>
      _$NutritionResponseFromJson(json);
}

List<String> _dynamicToStringList(dynamic value) {
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  } else if (value is String) {
    return [value]; // convert single string into a list
  }
  return [];
}

String? _dynamicToString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

@freezed
abstract class Nutrition with _$Nutrition {
  const factory Nutrition({
    String? id,
    String? localId,
    String? nutritionId,
    String? dishName,
    double? calories,
    double? protein,
    double? carbohydrates,
    double? fats,
    double? sodium,
    double? iron,
    double? calcium,
    double? freeSugar,
    double? fibre,
    double? sugar,
    List<String>? type,
    List<String>? day,

    // ✅ Corrected
    List<String>? time,
    String? selected,
  }) = _Nutrition;

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);
}
