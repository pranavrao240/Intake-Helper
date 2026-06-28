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
    @JsonKey(name: 'DishName') required String dishName,
    @JsonKey(name: 'DishImage') required String dishImage,
    @JsonKey(name: 'Calories') required double calories,
    @JsonKey(name: 'Protein') required double protein,
    @JsonKey(name: 'Carbohydrates') required double carbohydrates,
    @JsonKey(name: 'Fat') required double fat,
    @JsonKey(name: 'Fiber') required double fiber,
    @JsonKey(name: 'Sodium') required double sodium,
    @JsonKey(name: 'Iron') required double iron,
    @JsonKey(name: 'Calcium') required double calcium,
    @JsonKey(name: 'Sugar') required double sugar,
    @JsonKey(name: 'QuantityRequired') required String quantityRequired,
    required String type,
    required String time,
    @Default([]) List<dynamic> day,
  }) = _NutritionModel;

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);
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
