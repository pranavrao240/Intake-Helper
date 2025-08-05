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
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'id') String? localId,
    @JsonKey(name: 'nutritionId', fromJson: _dynamicToString)
    String? nutritionId,
    @JsonKey(name: 'DishName') String? dishName,
    @JsonKey(name: 'Calories') double? calories,
    @JsonKey(name: 'Protein') double? protein,
    @JsonKey(name: 'Carbohydrates') double? carbohydrates,
    @JsonKey(name: 'Fats') double? fats,
    @JsonKey(name: 'Sodium') double? sodium,
    @JsonKey(name: 'Iron') double? iron,
    @JsonKey(name: 'Calcium') double? calcium,
    @JsonKey(name: 'FreeSugar') double? freeSugar,
    @JsonKey(name: 'Fibre') double? fibre,
    @JsonKey(name: 'Sugar') double? sugar,
    @JsonKey(name: 'type', fromJson: _dynamicToStringList) List<String>? type,
    @JsonKey(name: 'day', fromJson: _dynamicToStringList) List<String>? day,

    // ✅ Corrected
    @JsonKey(name: 'time', fromJson: _dynamicToStringList) List<String>? time,
    @JsonKey(name: 'selected') String? selected,
  }) = _Nutrition;

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);
}
