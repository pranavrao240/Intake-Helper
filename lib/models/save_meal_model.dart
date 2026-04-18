import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_meal_model.freezed.dart';
part 'save_meal_model.g.dart';

@freezed
abstract class SavedMealModel with _$SavedMealModel {
  const factory SavedMealModel({
    @JsonKey(name: '_id') required String id,
    required String userId,
    required NutritionModel nutritionId,
    String? customNotes,
    String? quantity,
    required DateTime savedAt,
  }) = _SavedMealModel;

  factory SavedMealModel.fromJson(Map<String, dynamic> json) =>
      _$SavedMealModelFromJson(json);
}

@freezed
abstract class NutritionModel with _$NutritionModel {
  const factory NutritionModel({
    @JsonKey(name: '_id') required String id,
    required String selected,
    required String dishName,
    required String dishImage,
    required int calories,
    required int protein,
    required int fats,
    required int carbohydrates,
    required int sodium,
    required int calcium,
    required double iron,
    required String quantityRequired,
    required String type,
    required String time,
    required List<dynamic> day,
  }) = _NutritionModel;

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(_mapNutritionJsonKeys(json));
}

@freezed
abstract class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int currentPage,
    required int totalPages,
    required int totalItems,
    required int itemsPerPage,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

Map<String, dynamic> _mapNutritionJsonKeys(Map<String, dynamic> json) {
  return {
    ...json,
    'dishName': json['DishName'],
    'dishImage': json['DishImage'],
    'calories': json['Calories'],
    'protein': json['Protein'],
    'fats': json['Fats'],
    'carbohydrates': json['Carbohydrates'],
    'sodium': json['Sodium'],
    'calcium': json['Calcium'],
    'iron': json['Iron'],
    'quantityRequired': json['QuantityRequired'],
  };
}
