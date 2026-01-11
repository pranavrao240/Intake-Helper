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

String? _anyToString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

List<String>? _stringOrListToStringList(dynamic value) {
  if (value == null) return null;

  // Case: ["Breakfast"]
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }

  // Case: "Breakfast" or "NULL"
  if (value is String) {
    if (value.toUpperCase() == 'NULL' || value.isEmpty) return [];
    return [value];
  }

  return [];
}

double? _numToDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}

@freezed
abstract class Nutrition with _$Nutrition {
  const factory Nutrition({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? nutritionId,
    @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
    @JsonKey(name: 'DishName') String? dishName,
    @JsonKey(name: 'Calories', fromJson: _numToDouble) double? calories,
    @JsonKey(name: 'Protein', fromJson: _numToDouble) double? protein,
    @JsonKey(name: 'Carbohydrates', fromJson: _numToDouble)
    double? carbohydrates,
    @JsonKey(name: 'Fat', fromJson: _numToDouble) double? fats,
    @JsonKey(name: 'Fiber', fromJson: _numToDouble) double? fibre,
    @JsonKey(name: 'Sugar', fromJson: _numToDouble) double? sugar,
    @JsonKey(name: 'Sodium', fromJson: _numToDouble) double? sodium,
    @JsonKey(name: 'Iron', fromJson: _numToDouble) double? iron,
    @JsonKey(name: 'Calcium', fromJson: _numToDouble) double? calcium,
    @JsonKey(fromJson: _stringOrListToStringList) List<String>? type,
    @JsonKey(fromJson: _stringOrListToStringList) List<String>? time,
    @JsonKey(fromJson: _stringOrListToStringList) List<String>? day,
    @JsonKey(fromJson: _anyToString) String? selected,
  }) = _Nutrition;

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);
}
