// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedMealModel _$SavedMealModelFromJson(Map<String, dynamic> json) =>
    _SavedMealModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      nutritionId:
          NutritionModel.fromJson(json['nutritionId'] as Map<String, dynamic>),
      customNotes: json['customNotes'] as String?,
      quantity: json['quantity'] as String?,
      savedAt: DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$SavedMealModelToJson(_SavedMealModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'nutritionId': instance.nutritionId,
      'customNotes': instance.customNotes,
      'quantity': instance.quantity,
      'savedAt': instance.savedAt.toIso8601String(),
    };

_NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    _NutritionModel(
      id: json['_id'] as String,
      selected: json['selected'] as String,
      dishName: json['DishName'] as String,
      dishImage: json['DishImage'] as String,
      calories: (json['Calories'] as num).toDouble(),
      protein: (json['Protein'] as num).toDouble(),
      carbohydrates: (json['Carbohydrates'] as num).toDouble(),
      fat: (json['Fat'] as num).toDouble(),
      fiber: (json['Fiber'] as num).toDouble(),
      sodium: (json['Sodium'] as num).toDouble(),
      iron: (json['Iron'] as num).toDouble(),
      calcium: (json['Calcium'] as num).toDouble(),
      sugar: (json['Sugar'] as num).toDouble(),
      quantityRequired: json['QuantityRequired'] as String,
      type: json['type'] as String,
      time: json['time'] as String,
      day: json['day'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$NutritionModelToJson(_NutritionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'selected': instance.selected,
      'DishName': instance.dishName,
      'DishImage': instance.dishImage,
      'Calories': instance.calories,
      'Protein': instance.protein,
      'Carbohydrates': instance.carbohydrates,
      'Fat': instance.fat,
      'Fiber': instance.fiber,
      'Sodium': instance.sodium,
      'Iron': instance.iron,
      'Calcium': instance.calcium,
      'Sugar': instance.sugar,
      'QuantityRequired': instance.quantityRequired,
      'type': instance.type,
      'time': instance.time,
      'day': instance.day,
    };

_PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    _PaginationModel(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(_PaginationModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
    };
