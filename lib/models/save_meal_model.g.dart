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
      dishName: json['dishName'] as String,
      dishImage: json['dishImage'] as String,
      calories: (json['calories'] as num).toInt(),
      protein: (json['protein'] as num).toInt(),
      fats: (json['fats'] as num).toInt(),
      carbohydrates: (json['carbohydrates'] as num).toInt(),
      sodium: (json['sodium'] as num).toInt(),
      calcium: (json['calcium'] as num).toInt(),
      iron: (json['iron'] as num).toDouble(),
      quantityRequired: json['quantityRequired'] as String,
      type: json['type'] as String,
      time: json['time'] as String,
      day: json['day'] as List<dynamic>,
    );

Map<String, dynamic> _$NutritionModelToJson(_NutritionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'selected': instance.selected,
      'dishName': instance.dishName,
      'dishImage': instance.dishImage,
      'calories': instance.calories,
      'protein': instance.protein,
      'fats': instance.fats,
      'carbohydrates': instance.carbohydrates,
      'sodium': instance.sodium,
      'calcium': instance.calcium,
      'iron': instance.iron,
      'quantityRequired': instance.quantityRequired,
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
