import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_nutrition_model.freezed.dart';
part 'saved_nutrition_model.g.dart';

@freezed
abstract class SavedNutritionModel with _$SavedNutritionModel {
  const factory SavedNutritionModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: '_id', fromJson: _anyToString) String? localId,
    int? nutritionId,
    @JsonKey(name: 'DishName') String? dishName,
    @JsonKey(name: 'DishImage') String? dishImage,
    @JsonKey(name: 'QuantityRequired') String? quantityRequired,
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
    @JsonKey(name: 'isSaved') bool? isSaved,
    @JsonKey(fromJson: _anyToString) String? type,
    @JsonKey(fromJson: _anyToString) String? time,
    List<String>? day,
    @JsonKey(fromJson: _anyToString) String? selected,
  }) = _SavedNutritionModel;

  factory SavedNutritionModel.fromJson(Map<String, dynamic> json) =>
      _$SavedNutritionModelFromJson(json);
}

String? _anyToString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}

double? _numToDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
